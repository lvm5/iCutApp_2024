//  LoginView.swift
//  TestesSwiftUI
//  Created by Moacir Ezequiel Lamego on 2023.
//  Modify by Leandro Vansan on 2023.

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isShowingWelcome = false
    //@Environment private var schemeColor

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.7), Color.indigo.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                Image(systemName: "lock.shield")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                TextField("Nome de usuário", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .autocapitalization(.none)

                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Button(action: {
                    // Aqui você pode adicionar a lógica de autenticação
                    isShowingWelcome.toggle()
                }) {
                    Text("Entrar")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .blur(radius: isShowingWelcome ? 10 : 0)

            if isShowingWelcome {
                WelcomeView(username: $username, isShowingWelcome: $isShowingWelcome)
                    .transition(.move(edge: .trailing))
                //.animation(.spring)
            }
        }
    }
}

struct WelcomeView: View {
    @Binding var username: String
    @Binding var isShowingWelcome: Bool

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                Text("Bem-vindo, \(username)!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                Spacer()

                Button(action: {
                    isShowingWelcome.toggle()
                }) {
                    Text("Sair")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 20)

                //Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
