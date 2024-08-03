//
//  ContentView.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CityViewModel()
    @State private var searchText = ""
    @State private var selectedCity: City? = nil

    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.size.width > geometry.size.height {
                    // Horizontal Orientation
                    HStack {
                        cityList(geometry: geometry)
                        if let city = selectedCity {
                            CityMapView(city: city)
                                .frame(width: geometry.size.width / 2)
                        } else {
                            Spacer()
                                .frame(width: geometry.size.width / 2)
                        }
                    }
                } else {
                    // Vertical Orientation
                    NavigationView {
                        cityList(geometry: geometry)
                    }
                    .navigationTitle("Ciudades")
                }
            }
        }
        .onAppear {
            viewModel.loadCities()
        }
    }

    private func cityList(geometry: GeometryProxy) -> some View {
        VStack {
            TextField("Buscar ciudad", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            List {
                ForEach(viewModel.filterCities(prefix: searchText)) { city in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(city.name), \(city.country)")
                                .font(.headline)
                            Text("Lat: \(city.coord.lat), Lon: \(city.coord.lon)")
                                .font(.subheadline)
                        }
                        .onTapGesture {
                            if geometry.size.width > geometry.size.height {
                                // Horizontal Orientation: Update the map view
                                viewModel.selectedCity = city
                                selectedCity = city
                            } else {
                                // Vertical Orientation: Navigate to the map view
                                selectedCity = city
                            }
                        }
                    }
                    .contentShape(Rectangle())
                }
            }
        }
        .background(
            NavigationLink(
                destination: CityMapView(city: selectedCity ?? City(id: 0, country: "", name: "", coord: Coord(lat: 0, lon: 0))),
                isActive: Binding(
                    get: { selectedCity != nil },
                    set: { if !$0 { selectedCity = nil } }
                )
            ) {
                EmptyView()
            }
        )
    }
}







