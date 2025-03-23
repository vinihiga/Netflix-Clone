//
//  LargeBanner.swift
//  DesignSystem
//
//  Created by Vinicius Higa on 23/03/25.
//

import SwiftUI

public struct LargeBanner: View {
    public init() {}

    public var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: Token.Size.extraLarge2x)
            LargeCard()
            Spacer().frame(height: Token.Size.large)
        }
        .frame(width: UIScreen.main.bounds.size.width, height: Layout.height)
        .background(
            LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottom)
        )
    }

    public struct Layout {
        static let height: CGFloat = LargeCard.Layout.height + Token.Size.extraLarge2x + Token.Size.large
    }
}
