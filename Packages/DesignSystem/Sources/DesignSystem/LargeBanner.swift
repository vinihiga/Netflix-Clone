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
        VStack {}
            .frame(width: UIScreen.main.bounds.size.width, height: Layout.height)
            .background(
                LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottom)
            )
    }

    public struct Layout {
        static let height: CGFloat = 384.0
    }
}
