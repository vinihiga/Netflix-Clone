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
                HomeView(store: .init(initialState: HomeFeature.State(showcases: []), reducer: {
                    HomeFeature()
                }))
            }
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
