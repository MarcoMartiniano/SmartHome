//
//  SubHeaderView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 11.02.26.
//

import SwiftUI

struct HomeSubHeaderView: View {
    @Binding var itemsPerRow: Int
    
    @State private var isPressed = false
    @State private var triggerBounce = false
    
    var body: some View {
        HStack {
            Button {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                
                withAnimation(.spring(response: 0.8, dampingFraction: 0.55)) {
                    itemsPerRow = (itemsPerRow == 2) ? 1 : 2
                    triggerBounce.toggle()
                }
            } label: {
                Image(systemName: itemsPerRow == 2 ? "square.grid.2x2" : "list.bullet")
                    .font(.title2)
                    .foregroundColor(.blue)
                     .animatedBounce(isPressed: isPressed, triggerBounce: triggerBounce)
            }
            .buttonStyle(.plain)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        isPressed = true
                    }
                    .onEnded { _ in
                        isPressed = false
                    }
            )
            
            Spacer()
        }
        .padding(.vertical, 12)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    HomeSubHeaderView(itemsPerRow: .constant(2))
}
