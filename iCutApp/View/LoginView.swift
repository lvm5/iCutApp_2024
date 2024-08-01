////
////  LoginView.swift
////
////  Created by Moacir Ezequiel Lamego on 2023.
////  Modify by Leandro Vansan on 2023.
//
//import SwiftUI
//
//struct LoginView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var isShowingWelcome = false
//    @Environment(\.colorScheme) var colorScheme
//    //@Binding var selectedTab: Int
//    
//    var body: some View {
//        //NavigationView {
//            ZStack {
//                // MARK: -- PREENCHIMENTO DO FUNDO COM MeshGradient IOS18
//                if #available(iOS 18.0, *) {
//                    MeshGradient(
//                        width: 3,
//                        height: 3,
//                        points: [
//                            .init(0, 0.01), .init(0.5, 0.0), .init(1.0, 0.0),
//                            .init(0.5, 1.0), .init(0.7, 0.5), .init(1.0, 0.7),
//                            .init(0.0, 1.01), .init(0.0, 0.5), .init(0.0, 0.5)
//                        ],
//                        colors: [
//                            .teal.opacity(0.2), .purple.opacity(0.2), .indigo.opacity(0.2),
//                            .red.opacity(0.2), .blue.opacity(0.2), .pink.opacity(0.2),
//                            .purple.opacity(0.2), .red.opacity(0.2), .yellow.opacity(0.2),
//                        ]
//                    )
//                    .ignoresSafeArea()
//                    .shadow(color: .gray, radius: 25, x: -10, y: 10)
//                } else {
//                    LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.7), Color.indigo.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                        .ignoresSafeArea()
//                }
//                
//                VStack {
//                    Image("iCutCircle")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(height: 60)
//                        .clipShape(Circle())
//                        .padding(.bottom, 25)
//                    
//                    TextField("Nome de usuário", text: $username).font(.title3)
//                        .padding()
//                        .background(.ultraThickMaterial.opacity(0.8))
//                        .cornerRadius(10)
//                        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
//                        .padding(.horizontal)
//                        .autocapitalization(.none)
//                    
//                    SecureField("Senha", text: $password).font(.title3)
//                        .padding()
//                        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
//                        .background(.ultraThickMaterial.opacity(0.8))
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                    
//                    Button(action: {
//                        // ADICIONAR A LÓGICA DE AUTENTICAÇÃO
//                        isShowingWelcome.toggle()
//                    }) {
//                        Text("Entrar")
//                            .foregroundColor(colorScheme == .light ? .white.opacity(0.9) : .black.opacity(0.9))
//                            .font(.title2)
//                            .bold()
//                            .padding()
//                            .frame(width: UIScreen.main.bounds.width - 32, height: 60)
//                            .background(Color.purple)
//                            .cornerRadius(10)
//                            .padding(.horizontal)
//                    }
//                    .padding(.top, 20)
//                    
//                    Spacer()
//                    
//                    // MARK: -- TERMINAR VIEW CADASTRO DE USUÁRIOS
//                    NavigationView {
//                        NavigationLink {
//                            CriarConta()
//                        } label: {
//                            HStack(spacing: 3) {
//                                Text("Não tem uma conta?")
//                                Text("Criar conta")
//                                    .fontWeight(.bold)
//                            }
//                            .font(.system(size: 14))
//                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.6) : .black.opacity(0.5))
//                        }
//                    }
//                }
//                .padding()
//                .blur(radius: isShowingWelcome ? 10 : 0)
//                
//                if isShowingWelcome {
//                    WelcomeView(username: $username, isShowingWelcome: $isShowingWelcome)
//                        .transition(.move(edge: .bottom))
//                }
//            }
//        //}
//    }
//}
//
//struct WelcomeView: View {
//    @Binding var username: String
//    @Binding var isShowingWelcome: Bool
//    @Environment(\.dismiss) var dismiss
//    
//    //@Binding var selectedTab: Int
//    
//    
//    var body: some View {
//        ZStack {
//            // MARK: -- PREENCHIMENTO DO FUNDO COM MeshGradient IOS18
//            if #available(iOS 18.0, *) {
//                MeshGradient(
//                    width: 3,
//                    height: 3,
//                    points: [
//                        .init(0, 0.01), .init(0.5, 0.0), .init(1.0, 0.0),
//                        .init(0.5, 1.0), .init(0.7, 0.5), .init(1.0, 0.7),
//                        .init(0.0, 1.01), .init(0.0, 0.5), .init(0.0, 0.5)
//                    ],
//                    colors: [
//                        .teal.opacity(0.2), .purple.opacity(0.2), .indigo.opacity(0.2),
//                        .red.opacity(0.2), .blue.opacity(0.2), .pink.opacity(0.2),
//                        .purple.opacity(0.2), .red.opacity(0.2), .yellow.opacity(0.2),
//                    ]
//                    
//                )
//                .ignoresSafeArea()
//                .shadow(color: .gray, radius: 25, x: -10, y: 10)
//            } else {
//                LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.7), Color.indigo.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .ignoresSafeArea()
//            }
//            VStack {
//                Text("Por favor, marque sua agenda \(username).")
//                    .font(.title3.bold())
//                    .multilineTextAlignment(.center)
//                    .modifier(TextGlass())
//                    .frame(width: UIScreen.main.bounds.width - 32)
//                    .padding(.vertical, 20)
//                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
//                    .modifier(Glassify())
//                
//                ZStack {
//                    Image(systemName: "")
//                        .frame(width: UIScreen.main.bounds.width - 32, height: 500)
//                        .padding(.vertical, 20)
//                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
//                        .modifier(Glassify())
//                    // LIST DAYS/HOURS AND BUTTON
//                    
//                }
//                Button(action: {
//                    isShowingWelcome.toggle()
//                    dismiss()
//                }) {
//                    Text("Sair")
//                        .foregroundColor(.white)
//                        .font(.title2)
//                        .bold()
//                        .padding()
//                        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
//                        .background(Color.red)
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                }
//                .padding(.top, 20)
//            }
//            .padding()
//        }
//    }
//}
//
//
//#Preview {
//    LoginView()
//}


import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isShowingWelcome = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
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
                            .teal.opacity(0.3), .purple.opacity(0.3), .indigo.opacity(0.2),
                            .red.opacity(0.3), .blue.opacity(0.3), .pink.opacity(0.8),
                            .purple.opacity(0.8), .red.opacity(0.3), .yellow.opacity(0.8),
                        ]
                    )
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 25, x: -10, y: 10)
                } else {
                    LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.7), Color.indigo.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                }
                
                VStack {
                    Image("iCutCircle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                        .clipShape(Circle())
                        .padding(.bottom, 25)
                    
                    TextField("Nome de usuário", text: $username)
                        .font(.title3)
                        .padding()
                        .background(.ultraThickMaterial.opacity(0.8))
                        .cornerRadius(10)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
                        .padding(.horizontal)
                        .autocapitalization(.none)
                    
                    SecureField("Senha", text: $password)
                        .font(.title3)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
                        .background(.ultraThickMaterial.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    NavigationLink(destination: WelcomeView(username: $username, isShowingWelcome: $isShowingWelcome)) {
                        Text("Entrar")
                            .foregroundColor(colorScheme == .light ? .white.opacity(0.9) : .black.opacity(0.9))
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 32, height: 60)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    // MARK: -- TERMINAR VIEW CADASTRO DE USUÁRIOS
                    NavigationLink(destination: CriarConta()) {
                        HStack(spacing: 3) {
                            Text("Não tem uma conta?")
                            Text("Criar conta")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.6) : .black.opacity(0.5))
                    }
                    
                }
                .padding()
                .blur(radius: isShowingWelcome ? 10 : 0)
                
                if isShowingWelcome {
                    WelcomeView(username: $username, isShowingWelcome: $isShowingWelcome)
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

struct WelcomeView: View {
    @Binding var username: String
    @Binding var isShowingWelcome: Bool
    //@Binding(\Root.dismiss) var dismiss
    
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
                Text("Por favor, marque sua agenda \(username).")
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)
                    .modifier(TextGlass())
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .padding(.vertical, 20)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                    .modifier(Glassify())
                
                ZStack {
                    Image(systemName: "")
                        .frame(width: UIScreen.main.bounds.width - 32, height: 500)
                        .padding(.vertical, 20)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        .modifier(Glassify())
                    // LIST DAYS/HOURS AND BUTTON
                }
                
                Button(action: {
                    //dismiss()
                }) {
                    Text("Sair")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 60)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
