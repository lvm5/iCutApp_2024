//
//  MapView.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import SwiftUI
import MapKit
       


        extension CLLocationCoordinate2D {
            
        }

        struct MapView: View {
            
            @StateObject private var viewModel = ContentViewModel()
            
            let shamaBelezaEsteticaCoordinate = CLLocationCoordinate2D(latitude: 12.345678, longitude: 98.765432)
            
            var title: String
            
            var body: some View {
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .accentColor(Color(.systemPink))
                    .onAppear {
                        viewModel.checkIfLocationServicesIsEnable()
                    }
                
               // Marker("Shamá", coordinate: shamaBelezaEsteticaCoordinate)

            }
            
        }




#Preview {
    MapView(title: "Escolha um estabelecimento próximo")
}
