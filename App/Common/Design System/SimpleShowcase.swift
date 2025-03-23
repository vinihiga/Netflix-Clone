//
//  SimpleShowcase.swift
//  Netflix Clone
//
//  Created by Vinicius Higa on 23/03/25.
//

import SwiftUI

struct SimpleShowcase: View {
    private let title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        var totalHeight = Layout.Title.height + Layout.Card.height
        totalHeight += 2 * Layout.space

        return GeometryReader { geometryProxy in
            VStack(alignment: .leading) {
                Spacer(minLength: Layout.space)
                Header(geometryProxy)
                Showcase()
                Spacer(minLength: Layout.space)
            }
            .frame(height: geometryProxy.size.height)
        }
        .frame(height: totalHeight)
    }

    @ViewBuilder
    private func Header(_ geometryProxy: GeometryProxy) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(width: geometryProxy.size.width, alignment: .topLeading)
            .offset(x: Layout.Card.margin)
    }

    @ViewBuilder
    private func Showcase() -> some View {
        ScrollView(.horizontal) {
            LazyHStack {
                Spacer(minLength: Layout.Card.margin)
                VStack {}
                    .frame(width: Layout.Card.width, height: Layout.Card.height)
                    .background(Color.red)
                VStack {}
                    .frame(width: Layout.Card.width, height: Layout.Card.height)
                    .background(Color.red)
                VStack {}
                    .frame(width: Layout.Card.width, height: Layout.Card.height)
                    .background(Color.red)
                VStack {}
                    .frame(width: Layout.Card.width, height: Layout.Card.height)
                    .background(Color.red)
                VStack {}
                    .frame(width: Layout.Card.width, height: Layout.Card.height)
                    .background(Color.red)
                VStack {}
                    .frame(width: Layout.Card.width, height: Layout.Card.height)
                    .background(Color.red)
            }
        }
    }

    private struct Layout {
        struct Title {
            static let height: CGFloat = 32.0
        }

        struct Card {
            static let width: CGFloat = 96.0
            static let height: CGFloat = 128.0
            static let margin: CGFloat = 16.0
        }

        static let space: CGFloat = 8.0
    }
}
