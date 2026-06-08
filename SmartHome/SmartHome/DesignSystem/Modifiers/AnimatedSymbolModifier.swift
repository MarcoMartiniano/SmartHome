//
//  AnimatedSymbolModifier.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 13.02.26.
//

import SwiftUI

struct AnimatedSymbolModifier: ViewModifier {
    var animationType: SymbolAnimationType
    var foreground: Color = .blue
    
    @State private var shakeDegrees: Double = 0
    @State private var isAnimating: Bool = false

    func body(content: Content) -> some View {
        
        switch animationType {
        case .bounce(let isPressed, let triggerBounce):
            return AnyView(
                content
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(foreground)
                    .contentTransition(.symbolEffect(.replace))
                    .symbolEffect(.bounce, value: triggerBounce)
                    .scaleEffect(isPressed ? 0.85 : 1.0)
                    .animation(.easeOut(duration: 0.15), value: isPressed)
            )
            
        case .shake(let isShaking):
            return AnyView(
                content
                    .rotationEffect(.degrees(shakeDegrees))
                    .onAppear {
                        if isShaking && !isAnimating {
                            startShaking()
                        }
                    }
                    .onChange(of: isShaking) { oldValue, newValue in
                        if newValue {
                            startShaking()
                        } else {
                            withAnimation(.easeOut(duration: 0.1)) {
                                shakeDegrees = 0
                                isAnimating = false
                            }
                        }
                    }
            )
        }
    }
    
    private func startShaking() {
        isAnimating = true
        let baseAnimation = Animation.linear(duration: 0.07)
        withAnimation(baseAnimation.repeatForever(autoreverses: true)) {
            shakeDegrees = 2
        }
    }
}

extension View {
    // Bounce
    func animatedBounce(isPressed: Bool = false, triggerBounce: Bool = false, foreground: Color = .blue) -> some View {
        self.modifier(AnimatedSymbolModifier(animationType: .bounce(isPressed: isPressed, triggerBounce: triggerBounce), foreground: foreground))
    }
    
    // Shake
    func animatedShaking(isShaking: Bool, foreground: Color = .blue) -> some View {
        self.modifier(AnimatedSymbolModifier(animationType: .shake(isShaking: isShaking), foreground: foreground))
    }
}
