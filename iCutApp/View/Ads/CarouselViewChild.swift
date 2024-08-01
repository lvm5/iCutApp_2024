//
//  CarouselViewChild.swift
//  iCutApp
//
//  Created by Leandro Morais on 2024.02.11.
//

//
import SwiftUI

struct CarouselViewChild: View, Identifiable {

    var id: Int
    @ViewBuilder var content: any View

    var body: some View {

        ZStack {
            AnyView (content)

        }
    }
}
