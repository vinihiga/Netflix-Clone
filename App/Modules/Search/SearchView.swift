//
//  SearchView.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 23/03/25.
//

import ComposableArchitecture
import DesignSystem
import SwiftUI
import UIKit

struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    @State var store: StoreOf<SearchFeature>

    init(store: StoreOf<SearchFeature>) {
        self.store = store
    }

    var body: some View {
        VStack {
            ForEach(store.showcases, id: \.title) { showcase in
                SimpleShowcase(title: showcase.title)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            setupNavigation()
        }
        .onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
        .onAppear {
            store.send(.fetch)
        }
    }

    @ToolbarContentBuilder
    private func setupNavigation() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .tint(Color.white)
            }
        }

        ToolbarItem(placement: .principal) {
            HStack {
                Spacer(minLength: Token.Size.small)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                TextField(text: $store.searchText) {
                    Text("Search games, series, movies...")
                }
                .foregroundColor(.white)
            }
            .frame(
                width: UIScreen.main.bounds.width - 2 * Token.Size.large,
                height: Token.Size.large
            )
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            .cornerRadius(Token.Size.extraSmall)
        }
    }
}
