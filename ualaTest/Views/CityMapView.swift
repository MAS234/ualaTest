//
//  CityMapView.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
import SwiftUI
import MapKit

struct CityMapView: View {
    @ObservedObject var viewModel: CityMapViewModel
    @State private var showDetails = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: .constant(viewModel.getRegion()))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    showDetails = true
                }) {
                    Text("Mostrar detalles de la ciudad")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showDetails) {
            CityDetailView(city: viewModel.city)
        }
    }
}








































