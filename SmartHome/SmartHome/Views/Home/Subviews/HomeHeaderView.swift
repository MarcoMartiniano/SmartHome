//
//  HeaderView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 09.02.26.
//

import SwiftUI

struct HomeHeaderView: View {
    @State private var inputText: String = ""
    @State private var savedText = ""
    @Binding var items: [Item]
    @State var selected: DeviceOption = .light
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Home")
                .font(.title)
                .bold()
            HStack(spacing: 20) {
                TextField("Neues Gerät", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                DeviceDropdownView(selected: $selected)
            }

            Button {
                savedText = inputText
                inputText = ""
                
                if savedText.isEmpty { return }
                
                let newItem = Item(
                    deviceOption: selected,
                    title: savedText,
                    kind: selected.defaultKind
                )
                
                items.append(newItem)
                
            } label: {
                Text("hinzufügen")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 14))
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    HomeHeaderView(
        items: .constant(deviceItems)
    )
}
