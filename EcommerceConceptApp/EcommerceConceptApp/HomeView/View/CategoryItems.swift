//
//  CategoryItems.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct CategoryItems: View {
    
    @EnvironmentObject var vm: HomeViewModel
    
    let isSelected: Bool
    
    var imageName: String
    
    var body: some View {
        VStack {
            ZStack {
                Color(uiColor: isSelected ? UIColor(named: "new_orange")! : UIColor.white)
                    .frame(width: 71, height: 71)
                    .clipShape(Circle())
                Image(imageName)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .white : .gray)
            }
            .shadow(color: Color(uiColor: .lightGray.withAlphaComponent(0.4)),
                    radius: 5,
                    x: 2,
                    y: 2)
            Text(imageName)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? Color.newOrange : .black)
        }
        .onTapGesture {
            vm.selectedCategory = imageName
        }
        
    }
}

struct CategoryItems_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItems(isSelected: false, imageName: "asd")
    }
}
