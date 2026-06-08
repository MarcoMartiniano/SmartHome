//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 09.02.26.
//

import SwiftUI

struct SmartHomeView: View {
    @State var items: [Item] = deviceItems
    @State var itemsPerRow: Int = 2
    
    @State private var selectedIndex: Int? = nil
    
    var body: some View {
        VStack {
            HomeHeaderView(items: $items)
            HomeSubHeaderView(itemsPerRow: $itemsPerRow)
            HomeItemListView(
                items: $items,
                itemsPerRow: $itemsPerRow
            )
        }
        .padding()
    }
}

#Preview {
    SmartHomeView()
}
