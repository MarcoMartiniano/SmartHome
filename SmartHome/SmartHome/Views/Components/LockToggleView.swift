//
//  LockToggleView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 16.02.26.
//

import SwiftUI

struct LockToggleView: View {
    @Binding var isLocked: Bool
    
    var body: some View {
        Toggle(isOn: $isLocked) {
            Image(systemName: isLocked ? "lock.fill" : "lock.open.fill")
        }
        .labelsHidden()
    }
}
    
#Preview {
    LockToggleView(isLocked: .constant(false))
}
