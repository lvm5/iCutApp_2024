
//  ContentView.swift
//  iCutApp
//  Created by Leandro Morais on 04/11/23.

import SwiftUI

//MARK: -- ContentView
struct ContentView: View {
    
    @ObservedObject var viewModel = ServiceViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var navigationPath = NavigationPath()
    @State private var selectedTab = 0 // Estado para monitorar a aba selecionada
    
    init() {
        // Configuração para alterar a cor dos itens da tab bar
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Cor dos ícones não selecionados
    }
    
    var body: some View {
      
        NavigationStack(path: $navigationPath) {
            TabView(selection: $selectedTab) {
                NavigationView {
                    mainScrollView
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
                FavoritosView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favoritos")
                    }
                    .tag(1)
                
                AgendamentosView(title: "")
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Agendamentos")
                    }
                    .tag(2)
                
                MapView()
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Por perto")
                    }
                    .tag(3)
            }
            .accentColor(.purple) // Cor dos ícones e textos selecionados
            
            
            //MARK: -- AVALIAR O QUE FOI FEITO
            .onChange(of: selectedTab) { oldValue, newValue in
                if newValue == 0 {
                    navigationPath = NavigationPath() // Redefinir o caminho da navegação ao selecionar a aba Home
                }
            }
        }
    }
    
    // Separar o ScrollView principal
    private var mainScrollView: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ZStack {
                    header
                    VStack {
                        carouselSection
                    }
                    .padding(.top, 20)
                }
                categoriesSection
            }
        }
        .scrollIndicators(.hidden)
    }
    
    // Separar a seção do header
    private var header: some View {
        Section(header: Text("")
            .foregroundColor(.black)
            .font(.system(size: 15, weight: .heavy))) {
                Header()
            }
    }
    
    // Separar a seção do carrossel
    private var carouselSection: some View {
        Section(header: Text("")
            .foregroundColor(.yellow.opacity(0.7))
            .font(.system(size: 15, weight: .heavy))) {
                CarouselViewAuto()
            }
    }
    
    // Separar a seção das categorias
    private var categoriesSection: some View {
        ForEach(viewModel.categorias) { categoria in
            Section(header: Text(categoria.name)
                .font(.title2).fontWeight(.bold)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(categoria.services) { servico in
                                NavigationLink(destination: servico.destination) {
                                    ZStack(alignment: .bottom) {
                                        
                                        Image(servico.imageName)
                                            .resizable()
                                            .modifier(ImageModifier())
                                        
                                        Text(servico.name)
                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
                                            .modifier(TextModifier())
                                    }
                                    .frame(width: 350)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(height: 250)
                }
        }
    }
}

//MARK: -- ServiceDetailView
struct DetalheServicosView: View {
    var serviceTitle: String
    
    var body: some View {
        Text("Detalhes do serviço: \(serviceTitle)")
            .navigationTitle(serviceTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: -- MODIFICADOR DE IMAGENS
struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .cornerRadius(12.0)
    }
}

//MARK: -- MODIFICADOR DE TEXTOS
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .frame(width: 200.0, height: 40.0)
            .background(.ultraThinMaterial.opacity(0.8))
            .cornerRadius(8.0)
            .font(.system(size: 20, weight: .heavy))
            .padding(5.0)
    }
}

//MARK: -- VISUALIZAÇÃO DA TOOLBAR EM OUTRAS VIEWS
extension View {
    func customToolbar(title: String) -> some View {
        self.toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .foregroundColor(.purple)
                    .font(.custom("papyrus", size: 24))
            }
        }
    }
}

//MARK: -- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
