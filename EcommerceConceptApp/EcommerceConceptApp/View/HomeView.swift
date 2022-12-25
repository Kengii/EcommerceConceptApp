//
//  HomeView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 25.12.22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            HotSalesView(hotSalesItems: $viewModel.hotSales)
                .frame(height: 200)
                .cornerRadius(5)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
    }
}
