//
//  TabGetFontUseCase.swift
//  SparkComponentTab
//
//  Created by michael.zimmermann on 02.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol TabGetFontUseCaseable {
    func execute(typography: any Typography,
                 size: TabSize
    ) -> any TypographyFontToken
}

/// Use case which returns the font according to the tab size
struct TabGetFontUseCase: TabGetFontUseCaseable {

    /// Calculate the font according to the tab size
    /// - Parameters:
    /// - typograph, the current typograph from which to select a font
    /// - size: the given tab size
    ///
    /// - Returns: any TypographyFontToken
    func execute(typography: any Typography,
                 size: TabSize
    ) -> any TypographyFontToken {
        switch size {
        case .xs: return typography.caption
        case .sm: return typography.body2
        case .md: return typography.body1
        }
    }
}
