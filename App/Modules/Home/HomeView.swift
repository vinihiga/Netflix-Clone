//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 22/03/25.
//

import SwiftUI
import DesignSystem
import ComposableArchitecture

struct HomeView: View {
    private let store: StoreOf<HomeFeature>

    init(store: StoreOf<HomeFeature>) {
        self.store = store
    }

    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                LargeBanner()

                ForEach(store.showcases, id: \.title) { showcase in
                    SimpleShowcase(title: showcase.title)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .top)
        .toolbar {
            setupNavigation()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            store.send(.fetch)
        }
    }

    @ToolbarContentBuilder
    private func setupNavigation() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("To Vinicius")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }

        ToolbarItem(placement: .topBarTrailing) {
            NavigationLink {
                SearchView(store: .init(initialState: SearchFeature.State(searchText: "", showcases: []), reducer: {
                    SearchFeature()
                }))
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
        }
    }
}
