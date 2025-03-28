//
//  TabItemUIViewSnapshotTests.swift
//  SparkTabTests
//
//  Created by michael.zimmermann on 02.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkTab
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheme
import SparkBadge

final class TabItemUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties
    let theme = SparkTheme.shared
    var image: UIImage!
    var badge: BadgeUIView!

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        self.badge = BadgeUIView(theme: theme, intent: .danger, isBorderVisible: false)
        self.image = UIImage(systemName: "trash") ?? UIImage()
    }

    // MARK: - Tests
    func test_tab_with_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(title: "Label"))
        sut.apportionsSegmentWidthsByContent = false
        sut.backgroundColor = UIColor.systemBackground

        self.badge.value = 99
        sut.badge = self.badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.medium])
    }

    func test_selected_tab_with_intent_main() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(title: "Label"))
        sut.apportionsSegmentWidthsByContent = true
        sut.backgroundColor = UIColor.systemBackground

        sut.isSelected = true
        self.badge.value = 99
        sut.badge = self.badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.medium])
    }

    func test_with_badge_only() throws {

        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init()
        )
        sut.apportionsSegmentWidthsByContent = true
        sut.backgroundColor = UIColor.systemBackground

        self.badge.value = 99
        sut.badge = self.badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.medium])
    }

    func test_with_label_only() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(title: "Label"))
        sut.apportionsSegmentWidthsByContent = true
        sut.backgroundColor = UIColor.systemBackground

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_with_icon_only() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(icon: UIImage(systemName: "paperplane"))
        )
        sut.apportionsSegmentWidthsByContent = true
        sut.backgroundColor = UIColor.systemBackground

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.medium])
    }

    func test_with_label_and_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(title: "Label"))
        sut.apportionsSegmentWidthsByContent = true
        sut.backgroundColor = UIColor.systemBackground

        let badge = BadgeUIView(theme: self.theme, intent: .danger, value: 99)
        sut.badge = badge

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small, .medium, .large, .extraLarge])
    }

    func test_with_icon_and_label() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(
                icon: UIImage(systemName: "paperplane"),
                title: "Label"
            )
        )
        sut.apportionsSegmentWidthsByContent = true
        sut.backgroundColor = UIColor.systemBackground

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.large])
    }

    func test_with_icon_and_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(icon: UIImage(systemName: "paperplane"))
        )
        let badge = BadgeUIView(theme: self.theme, intent: .danger, value: 99)
        sut.apportionsSegmentWidthsByContent = true
        sut.badge = badge
        sut.backgroundColor = UIColor.systemBackground

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.extraSmall])
    }

    func test_with_icon_and_label_and_badge() throws {
        let sut = TabItemUIView(
            theme: self.theme,
            intent: .main,
            content: .init(
                icon: UIImage(systemName: "paperplane"),
                title: "Label"
            )
        )
        let badge = BadgeUIView(theme: self.theme, intent: .danger, value: 99)
        sut.apportionsSegmentWidthsByContent = true
        sut.badge = badge
        sut.backgroundColor = UIColor.systemBackground

        assertSnapshotInDarkAndLight(matching: sut, sizes: [.small])
    }
}
