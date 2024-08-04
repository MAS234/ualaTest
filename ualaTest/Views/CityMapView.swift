//
//  CityMapView.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
import SwiftUI
import MapKit

struct CityMapView: View {
    @StateObject private var viewModel: CityMapViewModel
    @State private var showDetails = false

    init(city: City) {
        _viewModel = StateObject(wrappedValue: CityMapViewModel(city: city))
    }

    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: [viewModel.coordinate]) { coordinate in
                MapAnnotation(coordinate: coordinate.coordinate) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                }
            }
            .navigationTitle(viewModel.city.name)
            .edgesIgnoringSafeArea(.all)

            Button(action: {
                showDetails = true
            }) {
                Text("Ver Detalles")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            .sheet(isPresented: $showDetails) {
                CityDetailView(city: viewModel.city)
            }
        }
        .onAppear {
            viewModel.updateRegion(for: viewModel.city)
        }
    }
}


