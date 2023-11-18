//
//  ContentView.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // MARK: NAVIGATION
        NavigationStack {
            
            //MARK: CONTEÚDO
            List() {
                
                //MARK: MAPA LOCAL
                Section(header: Text("Mapa local").font(.title2).fontWeight(.bold)) {
                    
                    NavigationLink(destination: MapView(title: "Escolha um estabelecimento próximo")) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.blue)
                            .padding(.horizontal)
                        Text("Locais próximos")
                    }
                    .font(.system(size: 30, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.blue)
                    
                }
                //.listRowSeparator(.hidden)
                
                
                //MARK: CORTES
                Section(header: Text("Corte de cabelo").font(.title2).fontWeight(.bold)) {
                    NavigationLink(destination: CorteMasculino(title: "Escolha o local")) {
                        VStack {
                            Image("corteMasculino")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Masculino")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
                    NavigationLink(destination: CorteFeminino(title: "Escolha o local")) {
                        VStack {
                            Image("corteFeminino")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Feminino")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                }
                .listRowSeparator(.hidden)
                
                //MARK: TRATAMENTO CAPILAR
                Section(header: Text("Tratamento capilar").font(.title2).fontWeight(.bold)) {
                    NavigationLink(destination: Tintura(title: "Escolha o local")) {
                        VStack {
                            Image("tintura")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Tinturas")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
                    NavigationLink(destination: Hidratacao(title: "Escolha o local")) {
                        VStack {
                            Image("hidratacao")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Hidratação")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
                    NavigationLink(destination: Penteados(title: "Escolha o local")) {
                        VStack {
                            Image("penteados")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Penteados")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                }
                .listRowSeparator(.hidden)
                
                //MARK: CUIDADOS DAS UNHAS
                Section(header: Text("Cuidados das unhas").font(.title2).fontWeight(.bold)) {
                    NavigationLink(destination: Manicure(title: "Escolha o local")) {
                        VStack {
                            Image("manicurePedicure")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Manicure e pedicure")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
//                    NavigationLink(destination: Pedicure(title: "Escolha o local")) {
//                        VStack {
//                            Image("pedicure")
//                                .resizable()
//                                .scaledToFit()
//                                .cornerRadius(20.0)
//                            
//                            Text("Pedicure")
//                                .padding(.horizontal)
//                                //.padding(.bottom)
//                                .font(.system(size: 15, weight: .medium))
//                                .foregroundColor(.gray.opacity(0.8))
//                        }
//                    }
                    
                    NavigationLink(destination: Podologia(title: "Escolha o local")) {
                        VStack {
                            Image("podologia")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Podologia")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                }
                .listRowSeparator(.hidden)
                
                //MARK: CUIDADOS DA PELE
                Section(header: Text("Cuidados da pele").font(.title2).fontWeight(.bold)) {
                    
                    NavigationLink(destination: Maquiagem(title: "Escolha o local")) {
                        VStack {
                            Image("maquiagem")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Maquiagem")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
                    NavigationLink(destination: LimpezaPele(title: "Escolha o local")) {
                        VStack {
                            Image("limpezaPele")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Limpeza de pele")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
                    NavigationLink(destination: Peeling(title: "Escolha o local")) {
                        VStack {
                            Image("peeling")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Peeling")
                                .padding(.horizontal)
                                //.padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                }
                .listRowSeparator(.hidden)
                
                
                //MARK: DEPILACAO
                Section(header: Text("Depilação").font(.title2).fontWeight(.bold)) {
                    
                    NavigationLink(destination: Depilacao(title: "Escolha o local")) {
                        VStack {
                            Image("depilacao")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20.0)
                            
                            Text("Buço e corporal")
                                .padding(.horizontal)
                                .padding(.bottom)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Início")
        }
        .scrollIndicators(.hidden)
    }
}



#Preview {
    ContentView()
}
