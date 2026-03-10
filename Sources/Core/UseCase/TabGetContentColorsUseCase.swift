//
//  TabGetContentColorsUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23.02.26.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabGetContentColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TabIntent,
        isSelected: Bool,
        isPressed: Bool
    ) -> TabContentColors
}

struct TabGetContentColorsUseCase: TabGetContentColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TabIntent,
        isSelected: Bool,
        isPressed: Bool
    ) -> TabContentColors {
        let colors = theme.colors

        let backgroundColorToken: any ColorToken = if isPressed {
            colors.states.surfacePressed
        } else {
            ColorTokenClear()
        }

        let tintColorToken: any ColorToken = if !isSelected {
            colors.base.onSurface
        } else {
            switch intent {
            case .basic: colors.basic.basic
            case .main: colors.main.main
            case .support: colors.support.support
            }
        }

        return TabContentColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken
        )
    }
}
