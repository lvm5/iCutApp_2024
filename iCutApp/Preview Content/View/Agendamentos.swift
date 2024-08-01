//
//  Agendamentos.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import SwiftUI

struct AgendamentosView: View {
    var title: String
    @State private var isAnimating = false
    
    var body: some View {
        
        ZStack {
            // MARK: -- PREENCHIMENTO DO FUNDO COM MeshGradient IOS18
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        .init(0, 0.01), .init(0.5, 0.0), .init(1.0, 0.0),
                        .init(0.5, 1.0), .init(0.7, 0.5), .init(1.0, 0.7),
                        .init(0.0, 1.01), .init(0.0, 0.5), .init(0.0, 0.5)
                    ],
                    colors: [
                        .teal.opacity(0.2), .purple.opacity(0.2), .indigo.opacity(0.2),
                        .mint.opacity(0.2), .blue.opacity(0.2), .cyan.opacity(0.2),
                        .green.opacity(0.2), .red.opacity(0.2), .yellow.opacity(0.2),
                    ]
                    
                )
                .ignoresSafeArea()
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            } else {
                LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.7), Color.indigo.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Agendamentos realizados")
                    .font(.system(size: 25))
                    .bold()
                    .padding(16)
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    AgendamentosView(title: "Meus agendamentos")
    
}
