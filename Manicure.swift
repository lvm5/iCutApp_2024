//
//  Manicure.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import SwiftUI

struct Manicure: View {
    var title: String

    var body: some View {
        
        // MARK: NAVIGATION
        NavigationStack {
            
            //MARK: CONTEÚDO
            List() {
                
                //NavigationLink(destination: ManicureEstabelecimentos()) {
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
                        .padding(.leading, 10)
                    }
                //}
                .listRowSeparator(.hidden)
                
                Divider()
                
                //NavigationLink(destination: ManicureEstabelecimentos()) {
                    HStack {
                        Image(systemName: "scissors")
                            .font(.title)
                        VStack(alignment: .leading) {
                            Text(studioMariliaLima.name.description)
                                .font(.system(size: 25, weight: .medium))
                                .foregroundColor(.pink)
                            Text(studioMariliaLima.location.description)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                //}
                
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Estabelecimentos")
            }
        }
    
    }


#Preview {
    Manicure(title: "Escolha o local")
}

