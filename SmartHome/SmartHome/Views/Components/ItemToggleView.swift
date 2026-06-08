//
//  ItemToggleView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 10.02.26.
//

import SwiftUI

struct ItemToggleView: View {
    @Binding var item: Item

    @ViewBuilder
    var body: some View {
        if case .toggle(_) = item.kind {
            Toggle(item.title, isOn: Binding(
                get: {
                    if case .toggle(let value) = item.kind { return value }
                    return false
                },
                set: { newValue in
                    item.kind = .toggle(newValue)
                }
            ))
            .labelsHidden()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let itemToggle = Item(
        deviceOption: .light,
        title: "Dining Room Light",
        kind: .toggle(true)
    )
    
    return ItemToggleView(item: .constant(itemToggle))
}
