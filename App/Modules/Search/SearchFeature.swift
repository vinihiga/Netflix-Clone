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
        Reduce { state, action in
            switch action {
            case .binding(\.searchText):
                return .send(.fetch)
            case .fetch:
                var title = "For you"

                if !state.searchText.isEmpty {
                    title = "Search results for " + state.searchText
                }

                let videos: [Video] = (0 ..< 6).map { _ in
                    .init(title: UUID().uuidString)
                }

                let showcase = Showcase(title: title, suggestions: videos)
                state.showcases = [showcase]
                return .none
            default:
                return .none
            }
        }
    }
}
