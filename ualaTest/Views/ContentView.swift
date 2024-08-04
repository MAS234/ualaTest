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
                                .id(city.id) // Add id to force view update
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

            Text("Ciudades")
                .font(.title2)
                .padding(.top, 10)

            List {
                ForEach(viewModel.filterCities(prefix: searchText)) { city in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(city.name), \(city.country)")
                                .font(.headline)
                            Text("Lat: \(city.coord.lat), Lon: \(city.coord.lon)")
                                .font(.subheadline)
                        }
                        .padding()
                        .background(selectedCity == city ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                        .scaleEffect(selectedCity == city ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: selectedCity)
                        .onTapGesture {
                            handleCitySelection(city)
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
                    get: { selectedCity != nil && geometry.size.width <= geometry.size.height },
                    set: { if !$0 { selectedCity = nil } }
                )
            ) {
                EmptyView()
            }
        )
    }

    private func handleCitySelection(_ city: City) {
        selectedCity = city
    }
}















