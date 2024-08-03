//
//  CityDetailView.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(city.name), \(city.country)")
                .font(.largeTitle)
                .padding(.bottom)

            Text("ID: \(city.id)")
                .font(.headline)

            Text("Coordenadas:")
                .font(.headline)
            Text("Latitud: \(city.coord.lat)")
            Text("Longitud: \(city.coord.lon)")

            Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Volver")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .padding()
        .navigationTitle("Detalles de la Ciudad")
    }
}



