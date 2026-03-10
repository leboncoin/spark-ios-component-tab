//
//  TabAccessibilityColorsUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23.02.26.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabAccessibilityColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: TabIntent) -> TabAccessibilityColors
}

struct TabAccessibilityColorsUseCase: TabAccessibilityColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: TabIntent) -> TabAccessibilityColors {
        let colors = theme.colors

        return switch intent {
        case .basic: .init(
            selectedTintcolorToken: colors.basic.onBasic,
            selectedBackgroundColorToken: colors.basic.basic
        )

        case .main: .init(
            selectedTintcolorToken: colors.main.onMain,
            selectedBackgroundColorToken: colors.main.main
        )

        case .support: .init(
            selectedTintcolorToken: colors.support.onSupport,
            selectedBackgroundColorToken: colors.support.support
        )
        }
    }
}
