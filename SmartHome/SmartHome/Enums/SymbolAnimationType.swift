//
//  SymbolAnimationType.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 13.02.26.
//

import SwiftUI

enum SymbolAnimationType {
    case bounce(isPressed: Bool, triggerBounce: Bool)
    case shake(isShaking: Bool)
}
