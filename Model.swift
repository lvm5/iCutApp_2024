//
//  Model.swift
//  iCutApp
//
//  Created by Leandro Morais on 07/11/23.
//

import Foundation
import SwiftUI
import SwiftData

class Estabelecimentos: Identifiable {
    var id: Int
    var name: String
    var location: String
    var latitude: Double
    var longitude: Double
    var number: String

    init(id: Int, name: String, location: String, latitude: Double, longitude: Double, number: String) {
        self.id = id
        self.name = name
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.number = number
    }
}

//MARK: ESTABELECIMENTOS
let shamaBelezaEstetica = Estabelecimentos(
    id: 0001,
    name: "Shamá Beleza e Estética",
    location: "Av. Santo Antônio, 1179 - Alto Cafezal, Marília - SP, 17511-313",
    latitude: -22.213934653027646,
    longitude: -49.95502123238539,
    number: "(14) 3367-2996")

let studioMariliaLima = Estabelecimentos(
   id: 0002,
   name: "Studio Marília Lima",
   location: "R. Rodrigues Alves, 853 - Alto Cafezal, Marília - SP, 17504-040",
   latitude: -22.216000603500035,
   longitude: -49.95724210148087,
   number: "")
 
