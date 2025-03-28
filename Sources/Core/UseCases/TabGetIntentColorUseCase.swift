//
//  TabGetIntentColorUseCase.swift
//  SparkTab
//
//  Created by alican.aycil on 21.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable
protocol TabGetIntentColorUseCaseble {
    func execute(colors: any Colors, intent: TabIntent) -> any ColorToken
}

/// TabGetColorUseCase
/// Use case to determin the colors of the Tab by the intent
/// Functions:
/// - execute: returns a color token for given colors and an intent
struct TabGetIntentColorUseCase: TabGetIntentColorUseCaseble {

    // MARK: - Functions
    ///
    /// Calculate the color of the tab depending on the intent
    ///
    /// - Parameters:
    ///    - colors: Colors from the theme
    ///    - intent: `TabIntent`.
    ///
    /// - Returns: ``ColorToken`` return color of the tab.
    func execute(colors: any Colors, intent: TabIntent) -> any ColorToken {
        switch intent {
        case .basic: return colors.basic.basic
        case .main: return colors.main.main
        case .support: return colors.support.support
        }
    }
}
