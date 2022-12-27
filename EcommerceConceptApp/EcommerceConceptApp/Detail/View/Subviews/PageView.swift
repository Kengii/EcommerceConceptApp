//
//  PageView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 27.12.22.
//

import SwiftUI
import SwiftUIPager

struct PageView: View {

    var imageData: [Data?]
    @State private var page: Page = .first()

    var body: some View {
        Pager(page: page, data: imageData, id: \.self) { item in
            Image(uiImage: UIImage(data: item ?? Data())
                    ?? UIImage())
                .resizable()
                .aspectRatio(0.8, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(radius: 5)
        }
            .itemAspectRatio(0.6)
            .itemSpacing(10)
            .padding(8)
            .interactive(scale: 0.8)
    }
}

