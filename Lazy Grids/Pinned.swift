//
//  Adaptive.swift
//  Lazy Grids
//
//  Created by Stewart Lynch on 2021-02-06.
//

import SwiftUI

struct Pinned: View {
    let colors:[Color]
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 50)),GridItem(.adaptive(minimum: 100, maximum: 120))]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns,
                      pinnedViews: [.sectionHeaders, .sectionFooters]) {
                Section(header: Text("Section 1")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemBackground))
                ) {
                    ForEach(1..<21) { index in
                        colors[index % colors.count]
                            .overlay(
                                Text("\(index)")
                            )
                            .frame(height: 100)
                    }
                }
                        Section(footer: Text("This is the footer")) {}
                        Section(header: Text("Section 2")
                                    .font(.title)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(.systemBackground))
                        ) {
                            ForEach(21..<401) { index in
                                colors[index % colors.count]
                                    .overlay(
                                        Text("\(index)")
                                    )
                                    .frame(height: 100)
                            }
                        }
            }
        }
        .embedInNavigation()
    }
}

struct Pinned_Previews: PreviewProvider {
    static var previews: some View {
        Pinned(colors: [.red, .orange, .yellow, .green, .blue, .purple, .gray])
    }
}
