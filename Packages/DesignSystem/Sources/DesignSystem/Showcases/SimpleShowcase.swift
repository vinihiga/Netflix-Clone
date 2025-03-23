//
//  SimpleShowcase.swift
//  DesignSystem
//
//  Created by Vinicius Higa on 23/03/25.
//

import SwiftUI

public struct SimpleShowcase: View {
    private let title: String

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        var totalHeight = Layout.Title.height + SimpleCard.Layout.height
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
                SimpleCard()
                SimpleCard()
                SimpleCard()
                SimpleCard()
                SimpleCard()
                SimpleCard()
            }
        }
    }

    public struct Layout {
        public struct Title {
            static let height: CGFloat = Token.Size.large
        }

        public struct Card {
            static let margin: CGFloat = Token.Size.medium
        }

        static let space: CGFloat = Token.Size.small
    }
}
