//
//  TabNavigationView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct TabNavigationView: View {

    @EnvironmentObject var viewModel: HomeViewModel

    let tabs = PageType.allCases.filter { $0 != .home }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.newBlue)
            HStack(spacing: 50) {
                HStack(spacing: 7) {
                    Button {
                        viewModel.didTapPage(.home)
                    } label: {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white)
                        MarkText("Explorer", size: 15, weight: .bold)
                            .foregroundColor(.white)
                    }
                }
                ForEach(tabs, id: \.self) { tab in
                    Button {
                        viewModel.didTapPage(tab)
                    } label: {
                        if tab == .cart {
                            HStack {
                                Image(tab.rawValue.lowercased())
                                    .foregroundColor(.white)
                                if viewModel.cartItemsCount != 0 {
                                    Text("\(viewModel.cartItemsCount)")
                                        .foregroundColor(.white)
                                }
                            }
                        } else {
                            Image(tab.rawValue.lowercased())
                                .foregroundColor(.white)
                        }
                    }
                }
            }
                .padding()
        }
            .frame(height: 72)
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
            .environmentObject(HomeViewModel(coordinator: HomeCoordinator()))
    }
}
