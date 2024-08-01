////
////  ServiceModel.swift
////  iCutApp
////
////  Created by Leandro Morais on 02.06.2024.
////
//
//import Foundation
//import SwiftUI
//
////MARK: -- CATEGORIAS
//struct Categoria: Identifiable {
//    var id = UUID()
//    var name: String
//    var services: [Servico]
//}
//
////MARK: -- SERVIÇOS
//struct Servico: Identifiable {
//    var id = UUID()
//    var name: String
//    var imageName: String
//    var destination: AnyView
//    var estabelecimentos: [Estabelecimento]
//}
//
////MARK: -- ESTABELECIMENTOS
//struct Estabelecimento: Identifiable {
//    var id = UUID()
//    var name: String
//    var address: String
//    var imageName: String
//    var employee: [Funcionario]
//}
//
////MARK: -- FUNCIONÁRIOS
//struct Funcionario: Identifiable {
//    var id = UUID()
//    var name: String
//    var schedule: [Agenda]
//}
//
////MARK: -- AGENDA DOS FUNCIONÁRIOS
//struct Agenda: Identifiable {
//    var id = UUID()
//    var disponibilidade: Bool
//    var hourWeek: Date
//}
