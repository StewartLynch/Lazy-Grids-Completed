//
//  Flexible.swift
//  Lazy Grids
//
//  Created by Stewart Lynch on 2021-02-06.
//

import SwiftUI

struct Flexible: View {
    let colors:[Color]
//    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
    let columns: [GridItem] = [GridItem(.flexible(minimum: 100, maximum: 100)), GridItem(),GridItem(),GridItem(),GridItem(),GridItem()]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(1..<401) { index in
                    colors[index % colors.count]
                        .overlay(
                            Text("\(index)")
                        )
                        .frame(height: 100)
                }
            }
        }
        .embedInNavigation()
    }
}

struct Flexible_Previews: PreviewProvider {
    static var previews: some View {
        Flexible(colors: [.red, .orange, .yellow, .green, .blue, .purple, .gray])
    }
}
