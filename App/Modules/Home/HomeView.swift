//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 22/03/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                SimpleShowcase(title: "Continue watching")
                SimpleShowcase(title: "Most popular right now")
                SimpleShowcase(title: "Action")
                SimpleShowcase(title: "Comedy")
                SimpleShowcase(title: "Romance")
                SimpleShowcase(title: "Horror")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        .navigationTitle("Netflix Clone")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
