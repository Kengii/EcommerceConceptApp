//
//  CloseButton.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct CloseButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    let imageName: String
    
    var body: some View {
        Button {
            dismiss.callAsFunction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
                Image(systemName: imageName)
                    .foregroundColor(.white)
            }
            .frame(width: 37, height: 37)
        }

    }
    
}
