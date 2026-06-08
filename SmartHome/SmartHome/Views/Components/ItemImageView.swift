//
//  ItemImageView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 16.02.26.
//

import SwiftUI

struct ItemImageView: View {
    @Binding var item: Item
    var imageSize: CGFloat = 18
    
    var body: some View {
        Image(systemName: item.deviceOption.icon)
            .foregroundColor(.blue)
            .font(.system(size: imageSize))
    }
}

#Preview {
    let itemButton = Item(
        deviceOption: .locked,
        title: "Dining Room Door",
        kind: .button(true)
    )
    ItemImageView(item: .constant(itemButton))
}
