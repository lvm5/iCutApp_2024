//
//  ServiceModel.swift
//  iCutApp
//
//  Created by Leandro Morais on 02.06.2024.
//

import Foundation
import SwiftUI

struct Categoria: Identifiable {
    var id = UUID()
    var title: String
    var services: [Servico]
    
}

struct Servico: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var destination: AnyView
    var estabelecimentos: [Estabelecimento]
}

struct Estabelecimento: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var imageName: String
    var employee: [Funcionario]
}

struct Funcionario: Identifiable {
    var id = UUID()
    var name: String
    var schedule: [Agenda]
}

struct Agenda: Identifiable {
    var id = UUID()
    var disponibilidade: Bool
    var hourWeek: Date
}
