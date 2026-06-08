//
//  ItemView.swift
//  SmartHome
//
//  Created by Marco Antonio Martiniano on 10.02.26.
//

import SwiftUI

struct HomeItemView: View {
    @Binding var item: Item
    @Binding var itemsPerRow: Int
    @Binding var showDeleteX: Bool
    var onDelete: (() -> Void)?
    var onTap: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 8) {
                if itemsPerRow == 1 {
                    HStack(alignment: .center, spacing: 12) {
                        ItemImageView(item: $item)
                        ItemHeaderView(item: $item)
                        SelectorTypeView(item: $item, itemsPerRow: itemsPerRow)
                    }
                } else {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            ItemImageView(item: $item)
                            ItemHeaderView(item: $item)
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            SelectorTypeView(item: $item, itemsPerRow: itemsPerRow)
                        }
                    }
                    .frame(height: 100)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .animatedShaking(isShaking: showDeleteX)
            .onLongPressGesture {
                withAnimation {
                    showDeleteX.toggle()
                }
            }.onTapGesture {
                onTap?()
            }
            
            if showDeleteX {
                Button(action: {
                    onDelete?()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(4)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

struct SelectorTypeView: View {
    @Binding var item: Item
    var itemsPerRow: Int
    
    var body: some View {
        switch item.deviceOption {
        case .light, .connection:
            ItemToggleView(item: $item)
        case .locked:
            ItemButtonView(item: $item)
            if(itemsPerRow != 1) {
                Spacer()
            }
        case .thermometer:
            ItemSliderView(item: $item)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        let itemButton = Item(
            deviceOption: .locked,
            title: "Dining Room Door",
            kind: .button(true)
        )
        let itemToggle = Item(
            deviceOption: .light,
            title: "Dining Room",
            kind: .toggle(true)
        )
        let itemSlider = Item(
            deviceOption: .thermometer,
            title: "Bathroom thermometer",
            kind: .slider(20)
        )

        HStack(spacing: 16) {
            HomeItemView(
                item: .constant(itemButton),
                itemsPerRow: .constant(2),
                showDeleteX: .constant(false)
            )
            HomeItemView(
                item: .constant(itemToggle),
                itemsPerRow: .constant(2),
                showDeleteX: .constant(false)
            )
        }
        HStack(spacing: 16) {
            HomeItemView(
                item: .constant(itemSlider),
                itemsPerRow: .constant(2),
                showDeleteX: .constant(false)
            )
            HomeItemView(
                item: .constant(itemToggle),
                itemsPerRow: .constant(2),
                showDeleteX:.constant(false)
            )
        }
        HStack(spacing: 16) {
            HomeItemView(
                item: .constant(itemSlider),
                itemsPerRow: .constant(1),
                showDeleteX: .constant(false)
            )
        }
    }
    .padding()
}
