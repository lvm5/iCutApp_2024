//
//  MapView.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.

// MARK: -- Marilia GPS
// Latitude    -22.22033220
// Longitude   -49.94812450

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.annotations) { annotation in
            MapPin(coordinate: annotation.coordinate, tint: .red)
        }
        .ignoresSafeArea(edges: .top)
        .accentColor(Color(.systemPink))
        .onAppear {
            viewModel.checkIfLocationServicesIsEnable()
            
#warning("Inserir marcadores dos estabelecimentos no mapa")
            // Adicione seus marcadores aqui
            viewModel.addAnnotation(at: CLLocationCoordinate2D(latitude: -22.22033220, longitude: -49.94812450), with: "Marília")
            viewModel.addAnnotation(at: CLLocationCoordinate2D(latitude: 12.345678, longitude: 98.765432), with: "Shama Beleza Estética")
        }
    }
}

extension MKPointAnnotation: @retroactive Identifiable {
    public var id: UUID {
        return UUID()
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            //.customToolbar(title: "title")
    }
}
