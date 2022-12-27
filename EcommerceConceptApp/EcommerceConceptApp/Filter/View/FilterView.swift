//
//  FilterView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

struct FilterView: View {

    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: FilterViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CloseButton(imageName: "xmark")
                Spacer()
                MarkText("Filter options", size: 18, weight: .medium)
                Spacer()
                Button {
                    dismiss.callAsFunction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.newOrange)
                        MarkText("Done", size: 18, weight: .medium)
                            .foregroundColor(.white)
                    }
                        .frame(width: 86, height: 37)
                }
            }
            ForEach(DropDownType.allCases, id: \.rawValue) { item in
                MarkText(item.rawValue, size: 18, weight: .medium)
                DropDownView(selectedOption: item == .size ? .constant("4.5 to 5.5 inches") : item == .brand ? $viewModel.brand: $viewModel.priceRange, type: item)
                    .environmentObject(viewModel)
            }
            Spacer()
        }
            .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel())
    }
}
