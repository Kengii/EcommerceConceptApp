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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(coordinator: DetailCoordinator()))
    }
}
