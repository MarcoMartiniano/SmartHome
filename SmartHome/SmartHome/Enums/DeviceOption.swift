//
//  DeviceOption.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 09.02.26.
//

import Foundation

enum DeviceOption: String, CaseIterable, Identifiable {
    case light = "Licht"
    case locked = "Schloss"
    case thermometer = "Thermostat"
    case connection = "Konnektivität"
    
    var id: String { rawValue }

    var icon: String {
        switch self {
        case .light: return "lightbulb"
        case .locked: return "lock.fill"
        case .thermometer: return "thermometer"
        case .connection: return "wifi"
        }
    }
}

enum ItemKind {
    case toggle(Bool)
    case button(Bool)
    case slider(Double)
}

extension DeviceOption {
    var defaultKind: ItemKind {
        switch self {
        case .light:
            return .toggle(false)
        case .connection:
            return .toggle(false)
        case .locked:
            return .button(false)
        case .thermometer:
            return .slider(20)
        }
    }
}
