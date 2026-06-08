//
//  TESTE.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 09.02.26.
//

import SwiftUI

struct DeviceDropdownView: View {
    @Binding var selected: DeviceOption

    var body: some View {
        Picker(selection: $selected) {
            ForEach(DeviceOption.allCases) { option in
                Label(option.rawValue, systemImage: option.icon)
                    .tag(option)
            }
        } label: {
            Label(selected.rawValue, systemImage: selected.icon)
        }
        .pickerStyle(MenuPickerStyle())
    }
}
        
#Preview(traits: .sizeThatFitsLayout) {
    DeviceDropdownView(selected: .constant(.light))
}
