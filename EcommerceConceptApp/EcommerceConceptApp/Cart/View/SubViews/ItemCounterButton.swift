//
//  ItemCounterButton.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import SwiftUI

struct ItemCounterButton: View {

    var priceForOne: Int
    @Binding var count: Int
    @Binding var total: Int

    var body: some View {
        VStack(spacing: 6) {
            Button {
                if count != 0 {
                    count -= 1
                    total -= priceForOne
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.white)
            }
            MarkText("\(count)", size: 20, weight: .medium)
                .foregroundColor(.white)
            Button {
                count += 1
                total += priceForOne
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }
        }
            .padding(14)
            .background(Color(UIColor(hex: "#282843") ?? .black))
    }
}

struct ItemCounterButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemCounterButton(priceForOne: 1200, count: .constant(5), total: .constant(2))
    }
}
