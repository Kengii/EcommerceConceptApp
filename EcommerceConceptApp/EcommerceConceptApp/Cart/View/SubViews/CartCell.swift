//
//  CartCell.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import SwiftUI

struct CartCell: View {
    
    let item: BasketItem
    
    @Binding var total: Int
    
    @State var count: Int = 1
    
    var body: some View {
        HStack {
            Image(uiImage: getImage(from: item))
                .resizable()
                .frame(width: 90, height: 100)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Spacer().frame(width: 16)
            VStack(alignment: .leading) {
                MarkText(item.title, size: 20, weight: .medium)
                    .foregroundColor(.white)
                MarkText("$\(String(format: "%.2f", Float(item.price * count)))", size: 20, weight: .medium)
                    .foregroundColor(Color.newOrange)
            }
            Spacer()
            ItemCounterButton(priceForOne: item.price, count: $count, total: $total)
                .clipShape(RoundedRectangle(cornerRadius: 26))
            Button {
                
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.gray)
            }

        }
    }
    
    func getImage(from item: BasketItem) -> UIImage {
        if let data = item.imageData {
            return UIImage(data: data) ?? UIImage()
        }
        return UIImage()
    }
}
