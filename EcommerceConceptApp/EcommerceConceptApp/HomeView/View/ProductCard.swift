//
//  ProductCard.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct ProductCard: View {
    
    var product: BestSeler
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(.white)
                .shadow(color: Color(UIColor.lightGray.withAlphaComponent(0.5)), radius: 5)
            VStack(alignment: .leading, spacing: 5) {
                Image(uiImage: UIImage(data: product.pictureData ?? Data()) ?? UIImage())
                    .resizable()
                    .frame(height: 168)
                    .aspectRatio(contentMode: .fit)
                HStack {
                    MarkText("$\(product.discountPrice)", size: 16, weight: .bold)
                        .foregroundColor(.black)
                    MarkText("$\(product.priceWithoutDiscount)", size: 15, weight: .bold)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
                MarkText("Samsung Galaxy S20 Ultra", size: 10)
            }
            .padding()
            
            VStack {
                HStack {
                    Spacer()
                    ZStack(alignment: .center) {
                        Color.white
                            .clipShape(Circle())
                        Image(systemName: product.isFavorites ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 11, height: 10)
                            .foregroundColor(.red)
                    }
                    .frame(width: 25)
                    .shadow(color: Color(UIColor.lightGray.withAlphaComponent(0.5)),
                            radius: 2)
                }
                Spacer(minLength: 192)
            }
            
            .padding()
        }
    }
}
