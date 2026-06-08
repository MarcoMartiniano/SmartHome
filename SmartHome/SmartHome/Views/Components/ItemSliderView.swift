//
//  ItemSliderView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 10.02.26.
//

import SwiftUI

struct ItemSliderView: View {
    @Binding var item: Item

    @ViewBuilder
    var body: some View {
        if case .slider(let currentValue) = item.kind {
            HStack(spacing: 12) {
                Slider(
                    value: Binding(
                        get: {
                            if case .slider(let value) = item.kind {
                                return value
                            }
                            return 20
                        },
                        set: { newValue in
                            item.kind = .slider(newValue)
                        }
                    ),
                    in: 12...30,
                    step: 0.5
                ).frame(height: 24)
                Text("\(currentValue, specifier: "%.1f") °C")
                    .font(.system(size: 10))
                    .frame(width: 40)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let itemSlider = Item(
        deviceOption: .thermometer,
        title: "Dining Room",
        kind: .slider(18)
    )
    
    return ItemSliderView(item: .constant(itemSlider))
}
