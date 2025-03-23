//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 22/03/25.
//

import SwiftUI
import DesignSystem

struct HomeView: View {
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {}
                    .frame(width: geometryProxy.size.width, height: 384.0)
                    .background(
                        LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottom)
                    )

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
    }
}
