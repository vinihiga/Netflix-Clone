//
//  NetflixCloneApp.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 22/03/25.
//

import SwiftUI

@main
struct NetflixCloneApp: App {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar {
                        SetupNavigation()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color.black, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }

    @ToolbarContentBuilder
    private func SetupNavigation() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("For Username")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }

        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "magnifyingglass", variableValue: 18.0)
                .foregroundColor(Color.white)
        }

        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "magnifyingglass", variableValue: 18.0)
                .foregroundColor(Color.white)
        }

        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "magnifyingglass", variableValue: 18.0)
                .foregroundColor(Color.white)
        }
    }
}
