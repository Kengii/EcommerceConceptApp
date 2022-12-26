//
//  CategoryView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            HStack {
                MarkText("Select category", size: 25)
                Spacer()
                Button {
                    print("view all pressed")
                } label: {
                    MarkText("view all", size: 15)
                }
                .foregroundColor(.newOrange)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
