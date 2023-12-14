//
//  Pedicure.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import SwiftUI

struct Pedicure: View {
    @State private var isSheetPresented = false // Adicionando a variável de estado para controlar a sheet
    var title: String
    
    var body: some View {
        
        NavigationStack {
            Button(action: { isSheetPresented = true}, label: {
                HStack {
                    Image("shama")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    VStack(alignment: .leading) {
                        Text(shamaBelezaEstetica.name.description)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.pink)
                            .padding(.bottom, 2.0)
                        Text(shamaBelezaEstetica.location.description)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    //.padding(.leading, 8)
                }                })
            
            Divider()
            
            Button(action: {isSheetPresented = true}, label: {
                HStack {
                    Image(systemName: "scissors")
                        .font(.title)
                    VStack(alignment: .leading) {
                        Text(shamaBelezaEstetica.name.description)
                            .font(.system(size: 25, weight: .medium))
                            .foregroundColor(.pink)
                        Text(shamaBelezaEstetica.location.description)
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                }                })
            
            Spacer()
            
            
        }
        //MARK: -- APRESENTAÇÃO (SHEET)
        .sheet(isPresented: $isSheetPresented) {
            ManicureEstabelecimentos()
        }
    }
}

#Preview {
    Pedicure(title: "Escolha o local")
}
