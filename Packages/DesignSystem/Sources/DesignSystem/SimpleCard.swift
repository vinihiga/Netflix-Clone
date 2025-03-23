//
//  SimpleCard.swift
//  DesignSystem
//
//  Created by Vinicius Higa on 23/03/25.
//

import SwiftUI

public struct SimpleCard: View {
    public init() {}

    public var body: some View {
        VStack {}
            .frame(width: Layout.width, height: Layout.height)
            .background(Color.red)
    }

    public struct Layout {
        static let width: CGFloat = 96.0
        static let height: CGFloat = 128.0
    }
}
