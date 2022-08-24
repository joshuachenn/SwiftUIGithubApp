//
//  ColorExtension.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/6/30.
//

import SwiftUI

extension Color {
    // 0xA83279 alpha = 1
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 0) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 16) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    // 0xffA83279
    init(hexAlphaChannel: UInt) {
        self.init(
            .sRGB,
            red: Double((hexAlphaChannel >> 0) & 0xff) / 255,
            green: Double((hexAlphaChannel >> 8) & 0xff) / 255,
            blue: Double((hexAlphaChannel >> 16) & 0xff) / 255,
            opacity: Double((hexAlphaChannel >> 24) & 0xff) / 255
        )
    }
}

extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            return (0, 0, 0, 0)
        }
        return (r, g, b, o)
    }
    
    func lighter(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> Color {
        return Color(red: min(Double(self.components.red + percentage/100), 1.0),
                     green: min(Double(self.components.green + percentage/100), 1.0),
                     blue: min(Double(self.components.blue + percentage/100), 1.0),
                     opacity: Double(self.components.opacity))
    }
}


extension Color {
    public static var subLightTextColor: Color {
        return Color("SubLightTextColor")
    }
    
    public static var primaryDarkColor: Color {
        return Color("1-PrimaryDarkColor")
    }
    
    public static var actionBlueColor: Color {
        return Color("ActionBlueColor")
    }
    
    public static var miLightColor: Color {
        return Color("MiWhiteColor")
    }
    
    public static var subTextColor: Color {
        return Color("SubTextColor")
    }
    
    public static var lightPrimaryColor: Color {
        return Color("LightPrimaryColor")
    }
}
