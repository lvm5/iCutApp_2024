//
//  CorteMasculino.swift
//  iCutApp
//
//  Created by Leandro Morais on 07/11/23.
//

import SwiftUI

struct CorteMasculino: View {

    @State private var isSheetPresented = false // Adicionando a variável de estado para controlar a sheet
    var title: String

    var body: some View {

        VStack {

            Spacer()

            Text("Estabelecimentos")
                .bold()
                .font(.title3)

            NavigationStack {
                Button(action: { isSheetPresented = true}, label: {
                    HStack {
                        Image("shama")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
//                            Text(shamaBelezaEstetica.name.description)
//                                .font(.system(size: 20, weight: .medium))
//                                .foregroundColor(.pink)
//                                .padding(.bottom, 2.0)
                            Text(shamaBelezaEstetica.location.description)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                    }
                })

                Divider()

                Button(action: {isSheetPresented = true}, label: {
                    HStack {
                        Image("shama")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
//                            Text(shamaBelezaEstetica.name.description)
//                                .font(.system(size: 20, weight: .medium))
//                                .foregroundColor(.pink)
//                                .padding(.bottom, 2.0)
                            Text(shamaBelezaEstetica.location.description)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                    }
                })

                Spacer()

            }
            //MARK: -- APRESENTAÇÃO (SHEET)
            .sheet(isPresented: $isSheetPresented) {
                MascEstabelecimentos(title: "Escolha um horário")
            }
        }
    }
}

#Preview {
    CorteMasculino(title: "Escolha um local")
}
