//
//  Theme.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 29/05/21.
//

import SwiftUI

public protocol Theme {
    var backgroundColor: Color { get }
    var textColor: Color { get }
}

public struct LightTheme: Theme {
    public let backgroundColor = Color.white
    public let textColor = Color(UIColor.darkGray)
    public init() {}
}

public struct DarkTheme: Theme {
    public let backgroundColor = Color(UIColor.darkGray)
    public let textColor = Color.white
    public init() {}
}

public struct BlueTheme: Theme {
    public var backgroundColor = Color.blue
    public var textColor = Color.white
    public init() {}
}

public struct MonochromeTheme: Theme {
    public var backgroundColor = Color.black
    public var textColor = Color.white
    public init() {}
}

