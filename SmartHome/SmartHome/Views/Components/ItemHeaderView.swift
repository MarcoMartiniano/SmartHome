//
//  ItemHeaderView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 16.02.26.
//

import SwiftUI

struct ItemHeaderView: View {
    @Binding var item: Item
    var titleSize: CGFloat = 14
    var subTitleSize: CGFloat = 12
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.title)
                .font(.system(size: titleSize))
                .lineLimit(2)
            Text(item.deviceOption.rawValue)
                .font(.system(size: subTitleSize))
                .fontWeight(.thin)
        }
        Spacer()
    }
}

#Preview {
    let itemButton = Item(
        deviceOption: .locked,
        title: "Dining Room Door",
        kind: .button(true)
    )
    ItemHeaderView(item: .constant(itemButton))
}
