//
//  SearchView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Color.white
                TextField("search", text: $viewModel.searchText)
                    .padding([.leading, .trailing])
            }
            .cornerRadius(17)
            .frame(height: 34)
            Button {
                return
            } label: {
                ZStack {
                    Color.newOrange
                    Image(systemName: "qrcode")
                        .foregroundColor(.white)
                }
            }
            .clipShape(Circle())
            .frame(width: 34, height: 34)

        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
    }
}
