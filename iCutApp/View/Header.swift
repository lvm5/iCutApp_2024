//
//  Header.swift
//  iCutApp
//
//  Created by Leandro Morais on 21.06.2024.
//

import SwiftUI

struct Header: View {
    @State private var naturalScrollOffset: CGFloat = 0
    @State private var lastNaturalOffset: CGFloat = 0
    @State private var headerOffset: CGFloat = 0
    @State private var isScrollingUp: Bool = false
    @State private var isLoginPresented: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let safeArea = geometry.safeAreaInsets
            let headerHeight = 60 + safeArea.top

            ScrollView(.vertical) {
                if #available(iOS 18.0, *) {
                    LazyVStack(spacing: 15) {

                    }
                    .safeAreaInset(edge: .top, spacing: 0) {
                        HeaderView()
                            .padding(.bottom, 15)
                            .frame(height: headerHeight, alignment: .bottom)
                            .background(.background)
                            .offset(y: -headerOffset)
                    }
                    .onScrollGeometryChange(for: CGFloat.self) { proxy in
                        let maxHeight = proxy.contentSize.height - proxy.containerSize.height
                        return min(proxy.contentOffset.y + headerHeight, maxHeight)
                    } action: { oldValue, newValue in
                        let isScrollingUp = oldValue < newValue
                        headerOffset = min(max(newValue - lastNaturalOffset, 0), headerHeight)
                        self.isScrollingUp = isScrollingUp
                        naturalScrollOffset = newValue
                    }
                } else {
                    HeaderView()
                }
            }
            .onChange(of: isScrollingUp) { oldValue, newValue in
                lastNaturalOffset = naturalScrollOffset - headerOffset
            }
            .ignoresSafeArea(.container, edges: .top)
        }
        .sheet(isPresented: $isLoginPresented) {
            loginView
        }
    }

    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 30) {
           
                Image("iCutCircle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 45)
                    .clipShape(Circle())
            
            Spacer(minLength: 0)

            Button(action: {
                // Ação de busca
            }) {
                Image(systemName: "magnifyingglass")
            }

            Button(action: {
                // Ação de notificações
            }) {
                Image(systemName: "bell")
            }

            Button(action: {
                isLoginPresented.toggle()
            }) {
                Image(systemName: "person.badge.key")
            }
        }
        .padding(.horizontal, 15)
        .font(.title2)
        .foregroundStyle(Color.purple)
    }

    private var loginView: some View {
        LoginView()
    }
}

#Preview {
    Header()
}
