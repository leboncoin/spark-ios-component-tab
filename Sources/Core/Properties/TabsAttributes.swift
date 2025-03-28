//
//  TabAttributes.swift
//  SparkTab
//
//  Created by michael.zimmermann on 30.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

/// Specific attributes of the tab control.
/// - lineHeight: The height of the bottom line.
/// - lineColor: The color of the bottom line.
/// - backgroundColor: The background color of the tab control.
struct TabsAttributes: Equatable {
    let lineHeight: CGFloat
    let itemHeight: CGFloat
    let lineColor: any ColorToken
    let backgroundColor: any ColorToken

    static func == (lhs: TabsAttributes, rhs: TabsAttributes) -> Bool {
        return lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.lineColor.equals(rhs.lineColor) &&
        lhs.lineHeight == rhs.lineHeight &&
        lhs.itemHeight == rhs.itemHeight
    }
}
