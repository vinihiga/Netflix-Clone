//
//  LargeCard.swift
//  DesignSystem
//
//  Created by Vinicius Higa on 23/03/25.
//

import SwiftUI

public struct LargeCard: View {
    public init() {}

    public var body: some View {
        VStack {}
            .frame(
                width: Layout.width,
                height: Layout.height
            )
            .background(Color.white)
            .cornerRadius(Layout.cornerRadius)
    }

    public struct Layout {
        static let width: CGFloat = 256.0
        static let height: CGFloat = 384.0
        static let cornerRadius: CGFloat = Token.Size.small
    }
}
