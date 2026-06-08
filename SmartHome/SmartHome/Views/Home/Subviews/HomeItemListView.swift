//
//  ItemListView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 10.02.26.
//

import SwiftUI

struct HomeItemListView: View {
    @Binding var items: [Item]
    @Binding var itemsPerRow: Int
    @State private var showDeleteXForAll: Bool = false

    var body: some View {
        VStack {
            ScrollView {
                Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                    ForEach(0..<rowsCount(), id: \.self) { rowIndex in
                        GridRow {
                            ForEach(0..<itemsPerRow, id: \.self) { columnIndex in
                                let itemIndex = rowIndex * itemsPerRow + columnIndex
                                
                                if itemIndex < items.count {
                                    HomeItemView(
                                        item: $items[itemIndex],
                                        itemsPerRow: $itemsPerRow,
                                        showDeleteX: $showDeleteXForAll,
                                        onDelete: {
                                            items.remove(at: itemIndex)
                                        }
                                    )
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    private func rowsCount() -> Int {
        (items.count + itemsPerRow - 1) / itemsPerRow
    }
}

#Preview {
    let itemLocked = Item(
        deviceOption: .locked,
        title: "Room Door",
        kind: .button(true)
    )
    
    let itemLight = Item(
        deviceOption: .light,
        title: "Dining Room Light",
        kind: .toggle(true)
    )
    
    let itemSlider = Item(
        deviceOption: .thermometer,
        title: "Bathroom Thermostat",
        kind: .slider(20)
    )
    
    let items = [itemLocked, itemLight, itemSlider]
    
    HomeItemListView(
        items: .constant(items),
        itemsPerRow: .constant(2)
    )
}
