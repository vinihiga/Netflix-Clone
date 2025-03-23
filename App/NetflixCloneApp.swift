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
        Self.setupAppearence()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar {
                        SetupNavigation()
                    }
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    @ToolbarContentBuilder
    private func SetupNavigation() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("To Vinicius")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }

        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .offset(y: -2.0) // Seems like Apple's has a padding bug with that image
        }

        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "arrow.down.circle")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
        }

        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
        }
    }

    private static func setupAppearence() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
    }
}
