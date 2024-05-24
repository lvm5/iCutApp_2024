//
//  CarrouselViewAuto.swift
//  iCutApp
//
//  Created by Leandro Morais on 2024.02.11.
//

import SwiftUI

struct CarouselViewAuto: View {

        var xDistance: Int = 150

        @State private var snappedItem = 0.0
        @State private var draggingItem = 1.0
        @State private var activeIndex: Int = 0


        var views: [CarouselViewChild] = placeholderCarouselChildView

        var body: some View {
            ZStack {
                ForEach(views) { view in
                    view
                        .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                        .opacity(1.0 - abs(distance(view.id)) * 0.3)
                        .offset(x: getOffset(view.id), y: 0)
                        .zIndex(1.0 - abs(distance(view.id)) * 0.1)
                }
//                Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
//                    withAnimation(.easeInOut(duration: 1)) {
//                        if activeIndex > activeIndex.count {
//                            activeIndex = 1
//                        }
//                        activeIndex += 1
//                    }
//                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 100
                    }
                    .onEnded { value in
                        withAnimation {
                            draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                            draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
                            snappedItem = draggingItem
                            self.activeIndex = views.count + Int(draggingItem)
                            if self.activeIndex > views.count || Int(draggingItem) >= 0 {
                                self.activeIndex = Int(draggingItem)
                            }
                        }
                    }
            )

        }

        func distance(_ item: Int) -> Double {
            return (draggingItem - Double(item).remainder(dividingBy: Double(views.count)))
        }

        func getOffset(_ item: Int) -> Double {
            let angle = Double.pi * 2 / Double(views.count) * distance(item)
            return sin(angle) * Double(xDistance)

        }

    }

    var placeholderCarouselChildView: [CarouselViewChild] = [

        CarouselViewChild(id: 1, content: {
            ZStack {
//                RoundedRectangle(cornerRadius: 18)
//                    .fill(Color.clear)
                Image("advertisingProductHair1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12.0)
                    .padding()
            }
            .frame(width: 200, height: 250)
        }),

        CarouselViewChild(id: 2, content: {
            ZStack {
//                RoundedRectangle(cornerRadius: 18)
//                    .fill(Color.clear)
                Image("advertisingProductHair2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12.0)
                    .padding()
            }
            .frame(width: 200, height: 250)
        }),

        CarouselViewChild(id: 3, content: {
            ZStack {
//                RoundedRectangle(cornerRadius: 18)
//                    .fill(Color.clear)
                Image("advertisingProductHair3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12.0)
                    .padding()
            }
            .frame(width: 200, height: 250)
        })

    ]

#Preview {
    CarouselViewAuto()
}

