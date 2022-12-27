//
//  CartView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    CloseButton(imageName: "chevron.left")
                    Spacer()
                    MarkText("Add address", size: 15, weight: .medium)
                    Button {
                        print("add address tapped")
                    } label: {
                        ZStack {
                            Color.newOrange
                            Image("map_placemark")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                        }
                    }
                    .cornerRadius(10)
                    .frame(width: 37, height: 37)
                }
                Spacer().frame(height: 50)
                MarkText("My cart", size: 35, weight: .bold)
            }
            .padding()
            Spacer().frame(height: 50)
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color.newBlue)
                    .ignoresSafeArea(edges: .bottom)
                VStack(spacing: 15) {
                    ScrollView {
                        ForEach(viewModel.cartItems, id: \.id) { item in
                            CartCell(item: item, total: $viewModel.total)
                        }
                    }
                    .padding(.top, 80)
                    .padding([.leading, .trailing])
                    Color(.gray)
                        .frame(height: 1)
                    VStack {
                        HStack {
                            MarkText("Total", size: 15)
                                .foregroundColor(.white)
                            Spacer()
                            MarkText("$\(viewModel.total)", size: 15, weight: .bold)
                                .foregroundColor(.white)
                        }
                        HStack {
                            MarkText("Delivary", size: 15)
                                .foregroundColor(.white)
                            Spacer()
                            MarkText("\(viewModel.basket.delivery)", size: 15, weight: .bold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding([.leading, .trailing], 32)
                    Color(.gray)
                        .frame(height: 1)
                    Button {
                        print("Checkout")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.newOrange)
                            MarkText("Checkout", size: 20, weight: .bold)
                                .foregroundColor(.white)
                        }
                        .frame(height: 55)
                    }
                    .padding([.leading, .trailing], 44)
                    .padding([.top, .bottom])
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
