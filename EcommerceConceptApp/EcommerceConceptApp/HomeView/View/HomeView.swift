//
//  HomeView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    private let bestSaleGridItem = GridItem(.fixed(181))

    var body: some View {
        ZStack(alignment: .bottom) {
        ScrollView {
            VStack {
                TopView()
                CategoryView()
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 23) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            CategoryItems(isSelected: category == viewModel.selectedCategory, imageName: category)
                                .environmentObject(viewModel)
                        }
                    }
                }
                .frame(height: 95)
                SearchView(viewModel: viewModel)
                HotSalesView(hotSalesItems: $viewModel.hotSales)
                    .frame(height: 200)
                    .cornerRadius(5)
                HStack {
                    MarkText("Best Seller", size: 25)
                    Spacer()
                    Button {
                        print("\"see more\" Best Seller button pressed")
                    } label: {
                        MarkText("see more", size: 15)
                    }
                    .foregroundColor(Color.newOrange)
                }
                LazyVGrid(columns: [bestSaleGridItem, bestSaleGridItem], spacing: 30) {
                    ForEach(viewModel.bestSale, id: \.id) { product in
                        ProductCard(product: product)
                            .frame(height: 227)
                            .onTapGesture {
                            }
                    }
                }
            }.padding()
        }
        .padding([.leading, .trailing, .top])
        .padding(.bottom, 80)
        TabNavigationView()
            .environmentObject(viewModel)
    }
        .background(.regularMaterial)
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {

        HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
    }
}
