//
//  DropDownView.swift
//  EcommerceConceptApp
//
//  Created by Владимир Данилович on 26.12.22.
//

import SwiftUI

enum DropDownType: String, CaseIterable {
    case brand = "Brand"
    case price = "Price"
    case size = "Size"
}

struct DropDownView: View {

    @EnvironmentObject var vm: FilterViewModel

    @Binding var selectedOption: String

    @State var isExpanded: Bool = false

    @State var height: CGFloat = 37

    let type: DropDownType

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.clear)
                .border(.gray, width: 1)
            VStack(spacing: 10) {
                HStack {
                    MarkText(selectedOption, size: 18)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? -540 : 0))
                        .animation(.linear, value: isExpanded)
                }
                    .padding([.leading, .trailing])
                if isExpanded {
                    switch type {
                    case .brand:
                        ForEach(vm.brands.filter({ $0 != selectedOption }), id: \.self) { brand in
                            HStack {
                                MarkText(brand, size: 18)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                                .padding(.leading)
                                .onTapGesture {
                                selectedOption = brand
                                isExpanded = false
                                height = 37
                            }
                        }
                            .transition(.scale)
                    case .price:
                        GeometryReader { geometry in
                            VStack {
                                HStack {
                                    Spacer()
                                    Button("Done") {
                                        withAnimation {
                                            isExpanded = false
                                            height = 37
                                        }
                                    }
                                }
                                    .padding(.trailing)
                                HStack {
                                    Picker("minimum", selection: $vm.selectedPriceMinimum) {
                                        ForEach(Array(stride(from: vm.priceMinimum, to: vm.priceMaximum, by: 200)), id: \.self) { num in
                                            Text("\(num)")
                                        }
                                    }
                                        .pickerStyle(.wheel)
                                        .frame(width: geometry.size.width / 2,
                                        height: 150,
                                        alignment: .center)
                                    Picker("maximum", selection: $vm.selectedPriceMaximum) {
                                        ForEach(Array(stride(from: vm.priceMaximum, to: vm.priceMinimum, by: -200)), id: \.self) { num in
                                            Text("\(num)")
                                        }
                                    }
                                        .pickerStyle(.wheel)
                                        .frame(width: geometry.size.width / 2, height: 150, alignment: .center)
                                }
                            }
                        }
                            .transition(.scale)
                    case .size: EmptyView()
                    }
                }
            }
        }
            .onTapGesture {
            withAnimation {
                guard type != .size else { return }
                isExpanded.toggle()
                if isExpanded {
                    switch type {
                    case .brand:
                        height = CGFloat(vm.brands.count * 40)
                    case .price:
                        height = 240
                    case .size:
                        height = 37
                    }
                } else {
                    height = 37
                }
            }
        }
            .frame(height: height)
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView(selectedOption: .constant("Samsung"), type: .brand)
            .environmentObject(FilterViewModel())
    }
}
