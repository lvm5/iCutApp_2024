//// iCut App
////
//// Created by Leandro Vansan 2023/2024
//
//
import SwiftUI
import MapKit


struct ContentView: View {
    @StateObject private var viewModel = ServiceViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        // Configuração para alterar a cor dos itens da tab bar
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Cor dos ícones não selecionados
    }
    
    var body: some View {
        TabView {
            // Home View
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        Section(header: Text("Ofertas da semana")
                            .foregroundColor(.yellow.opacity(0.9))
                            .font(.system(size: 20, weight: .heavy))) {
                                CarouselViewAuto()
                            }
                        
                        ForEach(viewModel.categories) { category in
                            Section(header: Text(category.title)
                                .font(.title2).fontWeight(.bold)) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        LazyHStack(spacing: 20) {
                                            ForEach(category.services) { service in
                                                NavigationLink(destination: service.destination) {
                                                    ZStack(alignment: .bottom) {
                                                        Image(service.imageName)
                                                            .resizable()
                                                            .modifier(ImageModifier())
                                                        
                                                        Text(service.title)
                                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
                                                            .modifier(TextModifier())
                                                    }
                                                }
                                                .frame(width: 350)
                                            }
                                        }
                                        .padding(.horizontal, 10)
                                    }
                                    .frame(height: 250)
                                }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("iCut")
                            .foregroundStyle(Color(.purple))
                            .font(.custom("papyrus", size: 24))
                        
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            
            //MARK: -- TABVIEW
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            // Favoritos View
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favoritos")
                }
                .tag(1)
            
            // Agendamentos View
            AgendamentosView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Agendamentos")
                }
                .tag(2)
            
            // Agendamentos View
            MapView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Por perto")
                }
                .tag(3)
            
            // Login View
            LoginView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Login")
                }
                .tag(4)
        }
        .accentColor(.purple) // Cor dos ícones e textos selecionados
    }
}



// Placeholder for FavoritesView
struct FavoritesView: View {
    var body: some View {
        Text("Favoritos")
            .navigationTitle("Favoritos")
    }
}

// Placeholder for AgendamentosView
struct AgendamentosView: View {
    var body: some View {
        Text("Agendamentos")
            .navigationTitle("Agendamentos")
    }
}

//MARK: -- ServiceDetailView
struct ServiceDetailView: View {
    var serviceTitle: String
    
    var body: some View {
        Text("Detalhes do serviço: \(serviceTitle)")
            .navigationTitle(serviceTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: -- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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



//struct ContentView: View {
//    @StateObject private var viewModel = ServiceViewModel()
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVStack(spacing: 20) {
//                    Section(header: Text("Ofertas da semana")
//                        .foregroundColor(.yellow.opacity(0.9))
//                        .font(.system(size: 20, weight: .heavy))) {
//                        CarouselViewAuto()
//                    }
//
//                    ForEach(viewModel.categories) { category in
//                        Section(header: Text(category.title)
//                            .font(.title2).fontWeight(.bold)) {
//                                ScrollView(.horizontal, showsIndicators: false) {
//                                    LazyHStack(spacing: 20) {
//                                        ForEach(category.services) { service in
//                                            NavigationLink(destination: service.destination) {
//                                                ZStack(alignment: .bottom) {
//                                                    Image(service.imageName)
//                                                        .resizable()
//                                                        .modifier(ImageModifier())
//
//                                                    Text(service.title)
//                                                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                                        .modifier(TextModifier())
//                                                }
//                                            }
//                                            .frame(width: 350) // Ajuste a largura conforme necessário
//                                        }
//                                    }
//                                    .padding(.horizontal, 10) // Espaço para mostrar parte do próximo item
//                                }
//                                .frame(height: 250) // Ajuste a altura conforme necessário
//                        }
//                    }
//                }
//            }
//            //.navigationTitle("Serviços")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//
////MARK: -- PREVIEW
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//// MARK: -- MODIFICADOR DE IMAGENS
//struct ImageModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .scaledToFit()
//            .cornerRadius(12.0)
//    }
//}
//
////MARK: -- MODIFICADOR DE TEXTOS
//struct TextModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(.horizontal)
//            .frame(width: 200.0, height: 40.0)
//            .background(.ultraThinMaterial.opacity(0.8))
//            .cornerRadius(8.0)
//            .font(.system(size: 20, weight: .heavy))
//            .padding(5.0)
//    }
//}



//MARK: -- CÓDIGO RODANDO ANTES DE REFATORAR
//struct ContentView: View {
//
//    @State private var currentIndex = 1
//    @Environment(\.colorScheme) var colorScheme
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//
//    var body: some View {
//
//
//
//
//        //MARK: CONTEÚDO
//        ScrollView {
//            LazyVStack(){ //spacing: 20, pinnedViews: [.sectionHeaders]) {
//            //MARK: -- ANUNCIOS
//                Section {
//                    VStack {
//                        Text("Ofertas relâmpago!")
//                            .foregroundColor(.yellow.opacity(0.9))
//                            .font(.system(size: 20, weight: .heavy))
//
//                        CarouselViewAuto()
//                    }
//                }
//                //MARK: -- CORTES
//                Section(header: Text("Corte de cabelo")
//                    .font(.title2).fontWeight(.bold)) {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            LazyHStack(spacing: 20) {
//                                NavigationLink(destination: CorteMasculino(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("corteMasculino")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Masculino")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//
//                                NavigationLink(destination: CorteFeminino(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("corteFeminino")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Feminino")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//                            }
//                            .scrollTargetLayout()
//                            .padding(.horizontal, 10) // Espaço para mostrar parte do próximo item
//                        }
//                        .scrollTargetBehavior(.paging)
//                        .frame(height: 250) // Ajuste a altura conforme necessário
//                    }
//
//
//                //MARK: -- TRATAMENTO CAPILAR
//                Section(header: Text("Tratamento capilar").font(.title2).fontWeight(.bold)) {
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        LazyHStack(spacing: 20) {
//                            NavigationLink(destination: Tintura(title: "Escolha o local")) {
//                                ZStack(alignment: .bottom) {
//                                    Image("tintura")
//                                        .resizable()
//                                        .modifier(ImageModifier())
//
//                                    Text("Tinturas")
//                                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                        .modifier(TextModifier())
//                                }
//                            }
//                            .frame(width: 350) // Ajuste a largura conforme necessário
//
//                            NavigationLink(destination: Hidratacao(title: "Escolha o local")) {
//                                ZStack(alignment: .bottom) {
//                                    Image("hidratacao")
//                                        .resizable()
//                                        .modifier(ImageModifier())
//
//                                    Text("Hidratação")
//                                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                        .modifier(TextModifier())
//                                }
//                            }
//                            .frame(width: 350) // Ajuste a largura conforme necessário
//
//                            NavigationLink(destination: Penteados(title: "Escolha o local")) {
//                                ZStack(alignment: .bottom) {
//                                    Image("penteados")
//                                        .resizable()
//                                        .modifier(ImageModifier())
//
//                                    Text("Penteados")
//                                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                        .modifier(TextModifier())
//                                }
//                            }
//                            .frame(width: 350) // Ajuste a largura conforme necessário
//                        }
//                        .scrollTargetLayout()
//                        .padding(.horizontal, 10) // Espaço para mostrar parte do próximo item
//                    }
//                    .scrollTargetBehavior(.paging)
//                    .frame(height: 250) // Ajuste a altura conforme necessário
//                }
//
//                //MARK: -- CUIDADOS DAS UNHAS
//                Section(header: Text("Cuidados das unhas")
//                    .font(.title2).fontWeight(.bold)) {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            LazyHStack(spacing: 20) {
//                                NavigationLink(destination: Manicure(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("manicurePedicure")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Manicure e pedicure")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//
//                                NavigationLink(destination: Podologia(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("podologia")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Podologia")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//                            }
//                            .scrollTargetLayout()
//                            .padding(.horizontal, 10) // Espaço para mostrar parte do próximo item
//                        }
//                        .scrollTargetBehavior(.paging)
//                        .frame(height: 250) // Ajuste a altura conforme necessário
//                    }
//
//                //MARK: -- CUIDADOS DA PELE
//                Section(header: Text("Cuidados da pele")
//                    .font(.title2).fontWeight(.bold)) {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            LazyHStack(spacing: 20) {
//                                NavigationLink(destination: Maquiagem(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("maquiagem")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Maquiagem")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//
//                                NavigationLink(destination: LimpezaPele(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("limpezaPele")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Limpeza de pele")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//
//                                NavigationLink(destination: Peeling(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("peeling")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Peeling")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//                            }
//                            .scrollTargetLayout()
//                            .padding(.horizontal, 10) // Espaço para mostrar parte do próximo item
//                        }
//                        .scrollTargetBehavior(.paging)
//                        .frame(height: 250) // Ajuste a altura conforme necessário
//                    }
//
//                //MARK: -- DEPILACAO
//                Section(header: Text("Depilação")
//                    .font(.title2).fontWeight(.bold)) {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            LazyHStack(spacing: 20) {
//                                NavigationLink(destination: Depilacao(title: "Escolha o local")) {
//                                    ZStack(alignment: .bottom) {
//                                        Image("depilacao")
//                                            .resizable()
//                                            .modifier(ImageModifier())
//
//                                        Text("Buço e corporal")
//                                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                            .modifier(TextModifier())
//                                    }
//                                }
//                                .frame(width: 350) // Ajuste a largura conforme necessário
//                            }
//                            .scrollTargetLayout()
//                            .padding(.horizontal, 10) // Espaço para mostrar parte do próximo item
//                        }
//                        .scrollTargetBehavior(.paging)
//                        .frame(height: 250) // Ajuste a altura conforme necessário
//                    }
//            }
//        }
//        //.padding(.top, 10)
//        .listStyle(.sidebar)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
////MARK: -- PREVIEW
//#Preview {
//    ContentView()
//}
//
//// MARK: -- MODIFICADOR DE IMAGENS
//struct ImageModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .scaledToFit()
//            .cornerRadius(12.0)
//    }
//}
//
////MARK: -- MODIFICADOR DE TEXTOS
//struct TextModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(.horizontal)
//            .frame(width: 200.0, height: 40.0)
//            .background(.ultraThinMaterial.opacity(0.8))
//            .cornerRadius(8.0)
//            .font(.system(size: 20, weight: .heavy))
//            .padding(5.0)
//    }
//}


//import SwiftUI
//import MapKit
//
//
//struct ContentView: View {
//
//    @State private var currentIndex = 1
//    @Environment(\.colorScheme) var colorScheme
//
//
//    var body: some View {
//
//        // MARK: NAVIGATION
//        NavigationStack {
//            VStack  {
//                Text("Ofertas relâmpago!")
//                    .foregroundColor(.yellow.opacity(0.9))
//                    .font(.system(size: 20, weight: .heavy))
//                    //.shadow(color: .black, radius: 0.3)
//
//                CarouselViewAuto()
//            }
//
//            //MARK: CONTEÚDO
//            List() {
//
//                //MARK: MAPA LOCAL
////                NavigationLink(destination: MapView(title: "Escolha um estabelecimento próximo")) {
////                    Image(systemName: "mappin.and.ellipse")
////                        .symbolEffect(.pulse)
////                        .foregroundColor(Color.red)
////                        .padding(.horizontal)
////                    Text("Encontre um local próximo...")
////                }
////                .font(.system(size: 20, weight: .medium))
////                .frame(maxWidth: .infinity)
////                .foregroundColor(.blue)
//
//                //MARK: CORTES
//                Section(header: Text("Corte de cabelo")
//                    .font(.title2).fontWeight(.bold)) {
//
//                        NavigationLink(destination: CorteMasculino(title: "Escolha o local")) {
//
//                            ZStack(alignment: .bottom) {
//                                Image("corteMasculino")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Masculino")
//                                    .foregroundColor(colorScheme == .dark ? .white.opacity(0.9) : .black.opacity(0.9))
//                                    .modifier(TextModifier())
//
//                            }
//                        }
//
//                        NavigationLink(destination: CorteFeminino(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("corteFeminino")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Feminino")
//                                    .modifier(TextModifier())
//                            }
//                        }
//                    }
//                    .listRowSeparator(.hidden)
//
//
//                //MARK: TRATAMENTO CAPILAR
//                Section(header: Text("Tratamento capilar").font(.title2).fontWeight(.bold)) {
//                    NavigationLink(destination: Tintura(title: "Escolha o local")) {
//                        ZStack(alignment: .bottom) {
//                            Image("tintura")
//                                .resizable()
//                                .modifier(ImageModifier())
//
//                            Text("Tinturas")
//                                .modifier(TextModifier())
//                        }
//                    }
//
//                    NavigationLink(destination: Hidratacao(title: "Escolha o local")) {
//                        ZStack(alignment: .bottom) {
//                            Image("hidratacao")
//                                .resizable()
//                                .modifier(ImageModifier())
//
//                            Text("Hidratação")
//                                .modifier(TextModifier())
//                        }
//                    }
//
//                    NavigationLink(destination: Penteados(title: "Escolha o local")) {
//                        ZStack(alignment: .bottom) {
//                            Image("penteados")
//                                .resizable()
//                                .modifier(ImageModifier())
//
//                            Text("Penteados")
//                                .modifier(TextModifier())
//                        }
//                    }
//                }
//                .listRowSeparator(.hidden)
//
//                //MARK: CUIDADOS DAS UNHAS
//                Section(header: Text("Cuidados das unhas")
//                    .font(.title2).fontWeight(.bold)) {
//                        NavigationLink(destination: Manicure(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("manicurePedicure")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Manicure e pedicure")
//                                    .modifier(TextModifier())
//                            }
//                        }
//
//                        NavigationLink(destination: Podologia(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("podologia")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Podologia")
//                                    .modifier(TextModifier())
//                            }
//                        }
//                    }
//                    .listRowSeparator(.hidden)
//
//                //MARK: CUIDADOS DA PELE
//                Section(header: Text("Cuidados da pele")
//                    .font(.title2).fontWeight(.bold)) {
//
//                        NavigationLink(destination: Maquiagem(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("maquiagem")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Maquiagem")
//                                    .modifier(TextModifier())
//                            }
//                        }
//
//                        NavigationLink(destination: LimpezaPele(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("limpezaPele")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Limpeza de pele")
//                                    .modifier(TextModifier())
//                            }
//                        }
//
//                        NavigationLink(destination: Peeling(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("peeling")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Peeling")
//                                    .modifier(TextModifier())
//                            }
//                        }
//                    }
//                    .listRowSeparator(.hidden)
//
//
//                //MARK: DEPILACAO
//                Section(header: Text("Depilação")
//                    .font(.title2).fontWeight(.bold)) {
//
//                        NavigationLink(destination: Depilacao(title: "Escolha o local")) {
//                            ZStack(alignment: .bottom) {
//                                Image("depilacao")
//                                    .resizable()
//                                    .modifier(ImageModifier())
//
//                                Text("Buço e corporal")
//                                    .modifier(TextModifier())
//                            }
//                        }
//                    }
//                    .listRowSeparator(.hidden)
//            }
//            .listStyle(.inset)
//            .navigationBarTitleDisplayMode(.automatic)
//            //.navigationTitle("Escolha o serviço")
//        }
//
//        .scrollIndicators(.hidden)
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
// // MODIFICADOR DE IMAGENS
//struct ImageModifier: Observable, ViewModifier {
//    func body(content: Content) -> some View {
//        content
//        //.resizable()
//            .scaledToFit()
//            .cornerRadius(20.0)
//    }
//}
//
//// MODIFICADOR DE TEXTOS
//struct TextModifier: Observable, ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding(.horizontal)
//            .frame(width: 200.0, height: 40.0)
//            .background(.ultraThinMaterial.opacity(0.8))
//            .cornerRadius(10.0)
//            .font(.system(size: 20, weight: .heavy))
//        //.foregroundColor(.black.opacity(0.8))
//            .padding(5.0)
//    }
//}
