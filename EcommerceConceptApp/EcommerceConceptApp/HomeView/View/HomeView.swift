//
//  HomeView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
    
    @State var isFilterScreenPresenting: Bool = false

    private let bestSaleGridItem = GridItem(.fixed(181))

    var body: some View {
        ZStack(alignment: .bottom) {
        ScrollView {
            VStack {
                HStack {
                    TopView()
                    Image("filter")
                        .onTapGesture {
                            isFilterScreenPresenting.toggle()
                        }
                }
                
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
                HStack {
                    MarkText("Hot Sales", size: 25)
                    Spacer()
                    Button {
                        print("Hot Sales button pressed")
                    } label: {
                        MarkText("see more", size: 15)
                    }
                    .foregroundColor(Color.newOrange)
                }
                HotSalesView(hotSalesItems: $viewModel.hotSales)
                    .frame(height: 200)
                    .cornerRadius(12)
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
                                viewModel.didTapDetail()
                            }
                    }
                }
            }
        }
        .padding([.leading, .trailing, .top])
        .padding(.bottom, 80)
        TabNavigationView()
            .environmentObject(viewModel)
    }
        .background(.regularMaterial)
//        .tabViewStyle(.page(indexDisplayMode: .never))
        
        .sheet(isPresented: $isFilterScreenPresenting) {
            FilterView(viewModel: FilterViewModel())
                .presentationDetents([.medium])
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {

        HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
    }
}
