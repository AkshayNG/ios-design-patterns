//
//  ThemeCreator.swift
//  ios-design-patterns
//
//  Created by Akshay Gajarlawar on 29/05/21.
//

//Factory Method: Decouples caller from concrete types
// promote loose coupling


public enum ColorProfile {
    case light
    case dark
    case blue
    case mono
}

public protocol ThemeCreator {
    static func makeTheme(profile: ColorProfile) -> Theme
}

extension ThemeCreator {
    static public func makeTheme(profile: ColorProfile) -> Theme {
        switch profile {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        case .blue:
            return BlueTheme()
        case .mono:
            return MonochromeTheme()
        }
    }
}

public class FactoryMethod: ThemeCreator {}

