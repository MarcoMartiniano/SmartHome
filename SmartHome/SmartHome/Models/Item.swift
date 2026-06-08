//
//  Item.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 10.02.26.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var deviceOption: DeviceOption
    var title: String
    var kind: ItemKind
    var isAlarmOn = false
}
