//
//  ItemInfo.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 11.02.26.
//

import Foundation

let deviceItems: [Item] = [
    Item(
        deviceOption: .locked,
        title: "Dining Room Door",
        kind: .button(true)
    ),
    Item(
        deviceOption: .light,
        title: "Dining Room Light",
        kind: .toggle(true)
    ),
    Item(
        deviceOption: .connection,
        title: "Dining Room Connection",
        kind: .toggle(true)
    ),
    Item(
        deviceOption: .thermometer,
        title: "Bathroom Thermostat",
        kind: .slider(20)
    )
]
