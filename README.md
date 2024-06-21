# Tabs
Tabs are the same as Segmented controls in UIKit. They have a list of horizontal items, each of which may be selected. Each tab element may have an icon, a title and a badge. Elements in the tab may be equally spaced to occupy the full width of the view. If the view is not wide enough to each tab, it will automatically become scrollable.

## Specifications
The tab specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/7461a4-tabs).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-tab/blob/main/.github/assets/anatomy.png)

## Usage
The tab is available in both UIKit and SwiftUI

### TabUIView (UIKit)

A tab can be initialized with just titles
Parameters:
* `theme`: Theme, the current theme to be used with the component.
* `intent`: TabIntent, intent on which colors will be base. The default value is `.basic`
* `tabSize`: TabSize, the size of the tabs. The default value is  = `.md`.
* `titles`: [String], a list of titles.
* `apportionsSegmentWidthsByContent`: Bool, determines whether each tab size is to depend on it's content or the space available. The default value is `false`.

Or it can be initialized with just images
Parameters:
* `theme`: Theme, the current theme to be used with the component.
* `intent`: TabIntent, intent on which colors will be base. The default value is `.basic`
* `tabSize`: TabSize, the size of the tabs. The default value is  = `.md`.
* `icons`: [Image], a list of icons.
* `apportionsSegmentWidthsByContent`: Bool, determines whether each tab size is to depend on it's content or the space available. The default value is `false`.

Or it can be initialized with content which contains both image and title
Parameters:
* `theme`: Theme, the current theme to be used with the component.
* `intent`: TabIntent, intent on which colors will be base. The default value is `.basic`
* `tabSize`: TabSize, the size of the tabs. The default value is  = `.md`.
* `content`: [TabItemUIContent], a list of content.
* `apportionsSegmentWidthsByContent`: Bool, determines whether each tab size is to depend on it's content or the space available. The default value is `false`.

Retrieving Tab changes:

* `publisher: some Publisher<Int, Never>` - Tab selection changes are published to the publisher. The index of the new selected tab is published.
* `delegate: TabUIViewDelegate?` - It is possible to set a delegate, to be notified of tab changes.
* It is possible to set an action for `valueChanged` which will be triggered when a tab changes.

Tab control:

* `badgeForSegment(at index: Int) -> UIView?` - Return a badge of the specified tab.
* `actionForSegment(at index: Int) -> UIAction?` - Return the action of a specific tab or segment.
* `setAction(_ action: UIAction, forSegmentAt index: Int)` - Set an action for the tab at the given index. This will be call, when the tab is tapped.
* `numberOfSegments: Int` - The number of tabs
* `segment(at index: Int) -> TabItemUIView?` - Return the tab at the given index
* `addSegment(with icon: UIImage, animated: Bool = false)` - Add a new tab
* `addSegment(with title: String, animated: Bool = false)` - Add a new tab
* `addSegment(withImage icon: UIImage, andTitle title: String, animated: Bool = false)` - Add a new tab
* `insertSegment(with icon: UIImage, at index: Int, animated: Bool = false)` - Insert a new tab.
* `insertSegment(with title: String, at index: Int, animated: Bool = false)` - Insert a new tab.
* `insertSegment(withImage icon: UIImage, andTitle title: String, at index: Int, animated: Bool = false)` - Insert a new tab.
* `setSegments(withImages icons: [UIImage])` - Update all content.
* `setSegments(withTitles titles: [String])` - Update all content.
* `setSegments(withContent content: [TabUIItemContent])` - Update all content.
* `setEnabled(_ isEnabled: Bool, at index: Int, animated: Bool = false)` - Enable a tab.
* `isEnabledForSegment(at index: Int) -> Bool` - Returns whether the given segment is enabled or not.
* `removeAllSegments()` - Remove all segments.
* `removeSegment(at index: Int, animated: Bool)` - Remove the segment at the given index.
* `selectedSegmentIndex: Int` - Set/Get the current selected tab.
* `scrollToSelectedSegement(animated: Bool)` - Scroll to selected tab.

### TabView (SwiftUI)

Initialization with just titles
Parameters
* `theme: Theme` - The current theme
* `intent: TabIntent = .basic` - The intent, default is basic
* `tabSize: TabSize = .md` - The tab size, the default is medium.
* `titles: [String]` - The titles of the tabs.
* `selectedIndex: Binding<Int>` - The current selected tab

Initialization with just images
Parameters
* `theme: Theme`
* `intent: TabIntent = .basic`
* `tabSize: TabSize = .md`
* `icons: [Image]`
* `selectedIndex: Binding<Int>`

Initialization with images and titles
* `theme: Theme`
* `intent: TabIntent = .basic`
* `tabSize: TabSize = .md`
* `content: [TabItemContent]`
* `selectedIndex: Binding<Int>`

View Modifiers
* `apportionsSegmentWidthsByContent(_ value: Bool)` - indicate whether width of the tabs should calculated ba the content 
* `disabled(_ disabled: Bool, index: Int)` - enable/disable a specific tab
* `disabled(_ disabled: Bool)` - enable/disable all tabs
* `selected(index: Int)` - set the selected tab
* `content(_ content: [TabItemContent])` - change the content of the tab
* `badge(_ badge: BadgeView?, index: Int)` - set a badge on a tab

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

