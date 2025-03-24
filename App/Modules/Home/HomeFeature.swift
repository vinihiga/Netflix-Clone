//
//  HomeFeature.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 23/03/25.
//

import ComposableArchitecture
import Foundation

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        var showcases: [Showcase]
    }

    enum Action {
        case fetch
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetch:
                let titles: [String] = ["Continue watching", "For you", "Action", "Comedy"]

                let showcases: [Showcase] = titles.map { title in
                    let videos: [Video] = (0 ..< 6).map { _ in
                        .init(title: UUID().uuidString)
                    }

                    return .init(title: title, suggestions: videos)
                }

                state.showcases = showcases
                return .none
            }
        }
    }
}
