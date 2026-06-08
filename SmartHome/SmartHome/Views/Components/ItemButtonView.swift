//
//  ItemButtonView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 10.02.26.
//

import SwiftUI

struct ItemButtonView: View {
    @Binding var item: Item
    var buttonSize: CGFloat = 12
    
    var body: some View {
        if case .button(let isSelected) = item.kind {
            
            let buttonName = isSelected ? "GESPERRT" : "GEÖFFNET"
            let backgroundColor: Color = isSelected ? .red : .green
            let fontColor: Color = isSelected ? .black : .white
            
            Button(buttonName) {
                item.kind = .button(!isSelected)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(backgroundColor)
            )
            .foregroundColor(fontColor)
            .font(.system(size: buttonSize))
            .bold()
            
        } else {
            EmptyView()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let itemLocked = Item(
        deviceOption: .locked,
        title: "Room Door",
        kind: .button(true)
    )
    
    return ItemButtonView(item: .constant(itemLocked))
}
