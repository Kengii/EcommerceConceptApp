//
//  HotSalesView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import SwiftUI

struct HotSalesView: View {

    @Binding var hotSalesItems: [Product]

    var body: some View {
        VStack {
            TabView {
                ForEach(hotSalesItems, id: \.id) { product in
                    ZStack {
                        Image(uiImage: getImageData(from: product))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        HStack {
                            VStack(alignment: .leading) {
                                if let isNew = product.isNew, isNew {
                                    ZStack {
                                        Color.newOrange
                                            .clipShape(Circle())
                                        MarkText("New", size: 10)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                        .frame(width: 27)
                                }
                                MarkText(product.title, size: 25)
                                    .foregroundColor(.white)
                                MarkText(product.subtitle, size: 11)
                                    .foregroundColor(.white)

                                Button {
                                    print("Buy tapped")
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(.white)
                                            .frame(width: 98, height: 23)
                                        MarkText("Buy now!", size: 11, weight: .bold)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            Spacer()
                        }
                            .padding(.leading, 23)
                            .padding([.top, .bottom], 32)
                    }
                }
            }
                .background(.black)
                .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
    func getImageData(from product: Product) -> UIImage {
        if let data = product.pictureData {
            return UIImage(data: data) ?? UIImage()
        }
        return UIImage()
    }
}


