//
//  DetailView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                CloseButton(imageName: "chevron.left")
                Spacer()
                MarkText("Product details", size: 18, weight: .medium)
                Spacer()
                Button {
                    viewModel.didTapCart()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.newOrange)
                        Image("cart")
                            .foregroundColor(.white)
                    }
                    
                }
                .frame(width: 37, height: 37)
            }
            
            .padding()
            PageView(imageData: viewModel.detail.imagesData)
                .frame(height: 300)
            InfoView()
                .environmentObject(viewModel)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(coordinator: DetailCoordinator()))
    }
}
