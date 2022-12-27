//
//  InfoView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import SwiftUI

struct InfoView: View {

    @EnvironmentObject var viewModel: DetailViewModel

    @State var isFavorite: Bool = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white)
                .shadow(radius: 30)
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 7) {
                                MarkText(viewModel.detail.title, size: 24, weight: .medium)
                                HStack {
                                    ForEach(0...5, id: \.self) { i in
                                        Image(systemName: Int(viewModel.detail.rating) >= i ? "star.fill" : "star")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                            Spacer()
                            Button {
                                withAnimation(.linear(duration: 0.2)) {
                                    isFavorite.toggle()
                                }
                            } label: {
                                ZStack {
                                    Color.black
                                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                                        .resizable()
                                        .frame(width: 14, height: 13)
                                        .foregroundColor(.white)
                                }
                                    .frame(width: 37, height: 37)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                            .padding()
                        LazyHStack(spacing: 60) {
                            ForEach(viewModel.tabs, id: \.self) { tab in
                                let index = Int(viewModel.tabs.firstIndex(of: tab) ?? 0)
                                let isSelected = index == viewModel.selectedTabIndex
                                VStack(spacing: 8) {
                                    MarkText(tab, size: 20, weight: isSelected ? .bold : .regular)
                                        .foregroundColor(isSelected ? .black : .gray)
                                    Color(uiColor: isSelected ? UIColor(named: "new_orange")! : UIColor.clear)
                                        .cornerRadius(1)
                                        .frame(height: 2)
                                }
                                    .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        viewModel.selectedTabIndex = index
                                    }
                                }
                            }
                        }
                            .frame(height: 1)
                            .padding()
                        Spacer().frame(height: 33)
                        HStack(spacing: 36) {
                            ForEach(viewModel.hardware.sorted(by: <), id: \.key) { (img, title) in
                                VStack(spacing: 5) {
                                    Image(img)
                                    MarkText(title, size: 11)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Spacer().frame(height: 28)
                        HStack {
                            MarkText("Select color and capacity", size: 16, weight: .medium)
                            Spacer()
                        }
                            .padding(.leading)

                        HStack {
                            HStack(spacing: 18) {
                                ForEach(viewModel.detail.color, id: \.self) { hex in
                                    ZStack {
                                        Color(uiColor: UIColor(hex: hex) ?? UIColor())
                                            .clipShape(Circle())
                                            .frame(width: 39)
                                        if viewModel.selectedColorHex == hex {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.white)
                                        }
                                    }
                                        .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)) {
                                            viewModel.selectedColorHex = hex
                                        }
                                    }
                                }
                                Spacer()
                                HStack(spacing: 30) {
                                    ForEach(viewModel.detail.capacity, id: \.self) { capacity in
                                        ZStack {
                                            if viewModel.selectedCapacity == capacity {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(Color.newOrange)
                                                    .frame(width: 70, height: 30)
                                            }
                                            MarkText("\(capacity) GB", size: 13, weight: .bold)
                                                .foregroundColor(viewModel.selectedCapacity == capacity ? .white : .gray)
                                        }
                                            .onTapGesture {
                                            withAnimation(.linear(duration: 0.2)) {
                                                viewModel.selectedCapacity = capacity
                                            }
                                        }
                                    }
                                }
                            }
                        }
                            .padding(.leading)
                            .padding(.trailing, 50)
                            .frame(height: 50)
                        Button {
                            viewModel.didTapAddToCart()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.newOrange)
                                    .frame(height: 54)
                                HStack {
                                    MarkText("Add to chart", size: 20, weight: .bold)
                                        .foregroundColor(.white)
                                    MarkText("$\(viewModel.detail.price)", size: 20, weight: .bold)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(DetailViewModel(coordinator: DetailCoordinator()))
    }
}
