//
//  SearchFeature.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 23/03/25.
//


import ComposableArchitecture
import Foundation

@Reducer
struct SearchFeature {
    @ObservableState
    struct State: Equatable {
        var searchText: String
        var showcases: [Showcase]
    }

    enum Action: BindableAction {
        case fetch
        case binding(BindingAction<State>)
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce {
            state,
            action in
            switch action {
            case .binding(\.searchText):
                return .send(.fetch)
            case .fetch:
                var showcases: [Showcase] = []
                
                if state.searchText.isEmpty {
                    showcases = mockDefaultRecommendations()
                } else {
                    showcases = mockCustomizedRecommendations(
                        with: state.searchText
                    )
                }

                state.showcases = showcases
                return .none
            default:
                return .none
            }
        }
    }

    private func mockDefaultRecommendations() -> [Showcase] {
        let titles: [String] = ["For you", "Action", "Comedy", "Horror", "Dorama"]

        let showcases: [Showcase] = titles.map { title in
            let videos: [Video] = (0 ..< 6).map { _ in
                .init(title: UUID().uuidString)
            }

            return .init(title: title, suggestions: videos)
        }

        return showcases
    }

    private func mockCustomizedRecommendations(
        with searchText: String
    ) -> [Showcase] {
        let searchResultLabel = "Search results for " + searchText

        let titles: [String] = [searchResultLabel, "Action", "Comedy", "Horror", "Dorama"]

        let showcases: [Showcase] = titles.map { title in
            let videos: [Video] = (0 ..< 6).map { _ in
                .init(title: UUID().uuidString)
            }

            return .init(title: title, suggestions: videos)
        }

        return showcases
    }
}
