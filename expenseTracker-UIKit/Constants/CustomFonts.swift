//
//  CustomFonts.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/03/2023.
//

import UIKit

extension ExpenseTracker.Fonts {
    //* MARK: Comment out to use SF Pro font family - to reduce app size
//    static let sfProDisplayBlack = "SFProDisplay-Black"
//    static let sfProDisplayBlackItalic = "SFProDisplay-BlackItalic"
//    static let sfProDisplayBold = "SFProDisplay-Bold"
//    static let sfProDisplayBoldItalic = "SFProDisplay-BoldItalic"
//    static let sfProDisplayHeavy = "SFProDisplay-Heavy"
//    static let sfProDisplayHeavyItalic = "SFProDisplay-HeavyItalic"
//    static let sfProDisplayLight = "SFProDisplay-Light"
//    static let sfProDisplayLightItalic = "SFProDisplay-LightItalic"
//    static let sfProDisplayMedium = "SFProDisplay-Medium"
//    static let sfProDisplayMediumItalic = "SFProDisplay-MediumItalic"
//    static let sfProDisplayRegular = "SFProDisplay-Regular"
//    static let sfProDisplayRegularItalic = "SFProDisplay-RegularItalic"
//    static let sfProDisplaySemibold = "SFProDisplay-Semibold"
//    static let sfProDisplayThin = "SFProDisplay-Thin"
//    static let sfProDisplayThinItalic = "SFProDisplay-ThinItalic"
//    static let sfProDisplayUltralight = "SFProDisplay-Ultralight"
//    static let sfProDisplayUltralightItalic = "SFProDisplay-UltralightItalic"
    
    
//    static func sfProDisplayBlack(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayBlack, size: size)!
//    }
    
//    static func sfProDisplayBlackItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayBlackItalic, size: size)!
//    }
    
    static func sfProDisplayBold(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayBold, size:size)!
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
//    static func sfProDisplayBoldItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayBoldItalic, size:size)!
//    }
    
//    static func sfProDisplayHeavy(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayHeavy, size:size)!
//    }
    
//    static func sfProDisplayHeavyItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayHeavyItalic, size:size)!
//    }
    
//    static func sfProDisplayLight(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayLight, size:size)!
//    }
    
//    static func sfProDisplayLightItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayLightItalic, size: size)!
//    }
    
    static func sfProDisplayMedium(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayMedium, size: size)!
        UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
//    static func sfProDisplayMediumItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayMediumItalic, size: size)!
//    }
    
    static func sfProDisplayRegular(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayRegular, size: size)!
        UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func sfProDisplayRegularItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayRegularItalic, size: size)!
        return UIFont.italicSystemFont(ofSize: size)
    }
    
    static func sfProDisplaySemibold(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplaySemibold, size: size)!
        UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
//    static func sfProDisplayThin(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayThin, size: size)!
//    }
    
//    static func sfProDisplayThinItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayThinItalic, size: size)!
//    }
    
//    static func sfProDisplayUltralight(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayUltralight, size: size)!
//    }
    
//    static func sfProDisplayUltralightItalic(size: CGFloat) -> UIFont {
//        return UIFont(name: sfProDisplayUltralightItalic, size: size)!
//    }
}


