

import SwiftUI
import Combine

struct CarouselViewAuto: View {

    var xDistance: Int = 150

    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State private var activeIndex: Int = 0

    // Timer para mudar o índice ativo
    @State private var timerSubscription: AnyCancellable?

    var views: [CarouselViewChild] = placeholderCarouselChildView

    var body: some View {
        ZStack {
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.5)
                    .opacity(1.0 - abs(distance(view.id)) * 0.85)
                    .offset(x: getOffset(view.id), y: 0)
                    .zIndex(1.0 - abs(distance(view.id)) * 0.9)
            }
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
                        self.activeIndex = (Int(draggingItem) + views.count) % views.count
                    }
                }
        )
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(views.count))
    }

    func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(item)
        return sin(angle) * Double(xDistance)
    }

    // Iniciar o timer
    func startTimer() {
        timerSubscription = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    activeIndex = (activeIndex + 1) % views.count
                    snappedItem = Double(activeIndex)
                    draggingItem = snappedItem
                }
            }
    }

    // Parar o timer
    func stopTimer() {
        timerSubscription?.cancel()
    }

}

var placeholderCarouselChildView: [CarouselViewChild] = [
    CarouselViewChild(id: 0) {
        ZStack {
            Image("advertisingProductHair1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10.0)
                .padding()
        }
        .frame(width: 250, height: 250)
    },
    CarouselViewChild(id: 1) {
        ZStack {
            Image("advertisingProductHair2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10.0)
                .padding()
        }
        .frame(width: 250, height: 250)
    },
    CarouselViewChild(id: 2) {
        ZStack {
            Image("advertisingProductHair3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10.0)
                .padding()
        }
        .frame(width: 250, height: 250)
    }
]

#Preview {
    CarouselViewAuto()
}


////
////  CarrouselViewAuto.swift
////  iCutApp
////
////  Created by Leandro Morais on 2024.02.11.
////
// ORIGINAL
//import SwiftUI
//
//struct CarouselViewAuto: View {
//
//        var xDistance: Int = 150
//
//        @State private var snappedItem = 0.0
//        @State private var draggingItem = 1.0
//        @State private var activeIndex: Int = 0
//
//
//        var views: [CarouselViewChild] = placeholderCarouselChildView
//
//        var body: some View {
//            ZStack {
//                ForEach(views) { view in
//                    view
//                        .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
//                        .opacity(1.0 - abs(distance(view.id)) * 0.3)
//                        .offset(x: getOffset(view.id), y: 0)
//                        .zIndex(1.0 - abs(distance(view.id)) * 0.1)
//                }
////                Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
////                    withAnimation(.easeInOut(duration: 1)) {
////                        if activeIndex > activeIndex.count {
////                            activeIndex = 1
////                        }
////                        activeIndex += 1
////                    }
////                }
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { value in
//                        draggingItem = snappedItem + value.translation.width / 100
//                    }
//                    .onEnded { value in
//                        withAnimation {
//                            draggingItem = snappedItem + value.predictedEndTranslation.width / 100
//                            draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
//                            snappedItem = draggingItem
//                            self.activeIndex = views.count + Int(draggingItem)
//                            if self.activeIndex > views.count || Int(draggingItem) >= 0 {
//                                self.activeIndex = Int(draggingItem)
//                            }
//                        }
//                    }
//            )
//
//        }
//
//        func distance(_ item: Int) -> Double {
//            return (draggingItem - Double(item).remainder(dividingBy: Double(views.count)))
//        }
//
//        func getOffset(_ item: Int) -> Double {
//            let angle = Double.pi * 2 / Double(views.count) * distance(item)
//            return sin(angle) * Double(xDistance)
//
//        }
//
//    }
//
//    var placeholderCarouselChildView: [CarouselViewChild] = [
//
//        CarouselViewChild(id: 1, content: {
//            ZStack {
////                RoundedRectangle(cornerRadius: 18)
////                    .fill(Color.clear)
//                Image("advertisingProductHair1")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(12.0)
//                    .padding()
//            }
//            .frame(width: 200, height: 230)
//        }),
//
//        CarouselViewChild(id: 2, content: {
//            ZStack {
////                RoundedRectangle(cornerRadius: 18)
////                    .fill(Color.clear)
//                Image("advertisingProductHair2")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(12.0)
//                    .padding()
//            }
//            .frame(width: 200, height: 230)
//        }),
//
//        CarouselViewChild(id: 3, content: {
//            ZStack {
////                RoundedRectangle(cornerRadius: 18)
////                    .fill(Color.clear)
//                Image("advertisingProductHair3")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(12.0)
//                    .padding()
//            }
//            .frame(width: 200, height: 230)
//        })
//
//    ]
//
//#Preview {
//    CarouselViewAuto()
//}
//


// MARK:-- TESTE 1 _______________________________________________________________
//  CarrouselViewAuto.swift
//  iCutApp
//
//  Created by Leandro Morais on 2024.02.11.
//


//MARK:-- TESTE 2_____________________________________
//
//  CarrouselViewAuto.swift
//  iCutApp
//
//  Created by Leandro Morais on 2024.02.11.
//

//import SwiftUI
//import Combine
//
//struct CarouselViewAuto: View {
//
//    var xDistance: Int = 150
//
//    @State private var snappedItem = 0.0
//    @State private var draggingItem = 0.0
//    @State private var activeIndex: Int = 0
//    @State private var isReversing: Bool = false
//
//    // Timer para mudar o índice ativo
//    @State private var timerSubscription: AnyCancellable?
//
//    var views: [CarouselViewChild] = placeholderCarouselChildView
//
//    var body: some View {
//        ZStack {
//            ForEach(views) { view in
//                view.content
//                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.5)
//                    .opacity(1.0 - abs(distance(view.id)) * 0.6)
//                    .offset(x: getOffset(view.id), y: -1)
//                    .zIndex(1.0 - abs(distance(view.id)) * 0.1)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { value in
//                    draggingItem = snappedItem + value.translation.width / 100
//                }
//                .onEnded { value in
//                    withAnimation {
//                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
//                        draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
//                        snappedItem = draggingItem
//                        activeIndex = (Int(draggingItem) + views.count) % views.count
//                    }
//                }
//        )
//        .onAppear {
//            startTimer()
//        }
//        .onDisappear {
//            stopTimer()
//        }
//    }
//
//    func distance(_ item: Int) -> Double {
//        return (draggingItem - Double(item)).remainder(dividingBy: Double(views.count))
//    }
//
//    func getOffset(_ item: Int) -> Double {
//        let angle = Double.pi * 2 / Double(views.count) * distance(item)
//        return sin(angle) * Double(xDistance)
//    }
//
//    // Iniciar o timer
//    func startTimer() {
//        timerSubscription = Timer.publish(every: 3, on: .main, in: .common)
//            .autoconnect()
//            .sink { _ in
//                withAnimation(.easeInOut(duration: 1)) {
//                    if isReversing {
//                        activeIndex -= 1
//                        if activeIndex < 0 {
//                            activeIndex = views.count - 1
//                            isReversing = false
//                        }
//                    } else {
//                        activeIndex += 1
//                        if activeIndex >= views.count {
//                            activeIndex = 0
//                            isReversing = true
//                        }
//                    }
//                    snappedItem = Double(activeIndex)
//                    draggingItem = snappedItem
//                }
//            }
//    }
//
//    // Parar o timer
//    func stopTimer() {
//        timerSubscription?.cancel()
//    }
//}
////MARK:-- PASSAR PARA CAROUSSEL VIEW CHILD
//struct CarouselViewChild: Identifiable {
//    var id: Int
//    var content: AnyView
//
//    init<Content: View>(id: Int, @ViewBuilder content: @escaping () -> Content) {
//        self.id = id
//        self.content = AnyView(content())
//    }
//}
//
//var placeholderCarouselChildView: [CarouselViewChild] = [
//    CarouselViewChild(id: 0) {
//        ZStack {
//            Image("advertisingProductHair1")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(12.0)
//                .padding()
//        }
//        .frame(width: 400, height: 430)
//    },
//    CarouselViewChild(id: 1) {
//        ZStack {
//            Image("advertisingProductHair2")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(12.0)
//                .padding()
//        }
//        .frame(width: 400, height: 430)
//    },
//    CarouselViewChild(id: 2) {
//        ZStack {
//            Image("advertisingProductHair3")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(12.0)
//                .padding()
//        }
//        .frame(width: 400, height: 430)
//    }
//]
//
//#Preview {
//    CarouselViewAuto()
//}
//
//
