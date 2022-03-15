//
//  ColorSchemePreview.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/03/15.
//

import SwiftUI

struct ColorSchemePreview<Content>: View where Content: View {
    let content: () -> Content

    private var colorSchemes: [ColorScheme] {
        [ColorScheme.light, ColorScheme.dark]
    }

    var body: some View {
        ForEach(colorSchemes, id: \.self) { colorScheme in
            content()
                .preferredColorScheme(colorScheme)
        }
    }
}
