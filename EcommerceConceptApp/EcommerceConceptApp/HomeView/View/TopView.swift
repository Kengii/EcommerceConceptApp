//
//  TopView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct TopView: View {

    var body: some View {
        HStack {
            Spacer()
            Image("map_placemark")
                .foregroundColor(Color.newOrange)
            MarkText("Minsk, Belarus", size: 15)
            Image(systemName: "chevron.down")
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
