//
//  CityViewModel.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import SwiftUI

class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var selectedCity: City?

    init() {
        loadCities()
    }

    func loadCities() {
        if let url = URL(string: "https://gist.githubusercontent.com/hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let cities = try decoder.decode([City].self, from: data)
                        DispatchQueue.main.async {
                            self.cities = cities.sorted { $0.name < $1.name }
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }

    func filterCities(prefix: String) -> [City] {
        if prefix.isEmpty {
            return cities
        } else {
            return cities.filter { $0.name.lowercased().hasPrefix(prefix.lowercased()) }
        }
    }
}

