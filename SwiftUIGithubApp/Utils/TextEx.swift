//
//  FontStyle.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/30.
//

import SwiftUI

extension Text {
    func minText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 12, weight: .regular, design: design))
            .foregroundColor(Color(UIColor.tertiaryLabel))
    }
    
    func smallWhiteText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .regular, design: design))
            .foregroundColor(.white)
    }
    
    func smallText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .regular, design: design))
            .foregroundColor(.primary)
    }
    
    func smallBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .bold, design: design))
            .foregroundColor(.primary)
    }
    
    func smallSubLightText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .regular, design: design))
            .foregroundColor(Color(UIColor.tertiaryLabel))
    }
    
    func smallActionLightText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .regular, design: design))
            .foregroundColor(.accentColor)
    }
    
    func smallMiLightText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .regular, design: design))
            .foregroundColor(Color(UIColor.quaternaryLabel))
    }
    
    func smallSubText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 14, weight: .regular, design: design))
            .foregroundColor(.secondary)
    }
    
    func middleText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .regular, design: design))
            .foregroundColor(.primary)
    }
    
    func middleWhiteText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .regular, design: design))
            .foregroundColor(.white)
    }
    
    func middleSubText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .regular, design: design))
            .foregroundColor(.secondary)
    }
    
    func middleSubLightText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .regular, design: design))
            .foregroundColor(Color(UIColor.tertiaryLabel))
    }
    
    func middleBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .bold, design: design))
            .foregroundColor(.primary)
    }
    
    func middleWhiteBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .bold, design: design))
            .foregroundColor(.white)
    }
    
    func middleBoldSubText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 16, weight: .regular, design: design))
            .foregroundColor(.secondary)
    }
    
    func normalText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .regular, design: design))
            .foregroundColor(.primary)
    }
    
    func normalBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .bold, design: design))
            .foregroundColor(.primary)
    }
    
    func normalSubText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .regular, design: design))
            .foregroundColor(.secondary)
    }
    
    func normalWhiteText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .regular, design: design))
            .foregroundColor(.white)
    }
    
    func normalMiWhiteBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .bold, design: design))
            .foregroundColor(Color(UIColor.quaternaryLabel))
    }
    
    // normalTextActionWhiteBold
    func normalActionBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .bold, design: design))
            .foregroundColor(.accentColor)
    }
    
    func normalLightPrimaryText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 18, weight: .bold, design: design))
            .foregroundColor(.lightPrimaryColor)
    }
    
    func largeText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 23, weight: .regular, design: design))
            .foregroundColor(.primary)
    }
    
    func largeBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 23, weight: .bold, design: design))
            .foregroundColor(.primary)
    }
    
    func largeWhiteText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 23, weight: .regular, design: design))
            .foregroundColor(.white)
    }
    
    func largeWhiteBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 23, weight: .bold, design: design))
            .foregroundColor(.white)
    }
    
    func enlargerWhiteBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 30, weight: .bold, design: design))
            .foregroundColor(.white)
    }
    
    func enlargerBoldText(design: Font.Design = .default) -> Text {
        self
            .font(.system(size: 30, weight: .bold, design: design))
            .foregroundColor(.white)
    }
}
