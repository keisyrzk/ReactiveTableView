//
//  FooterConfigData.swift
//  Lerni
//
//  Created by Esteban on 08/02/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

class FooterConfigData {
    
    enum Alignment {
        case top
        case center
        case bottom
    }
    
    enum FooterStyle {
        case text
        case separator
    }
    
    var style: FooterStyle
    var alignment: Alignment
    var footerHeight: CGFloat
    var topSpace: CGFloat
    var bottomSpace: CGFloat
    var sideSpace: CGFloat
    var separatorHeight: CGFloat
    var footerBackgroundColor: UIColor
    var separatorColor: UIColor
    var text: String
    
    init(style: FooterStyle = .separator,
         alignment: Alignment = .center,
         footerHeight: [CGFloat] = [5],
         topSpace: [CGFloat] = [0],
         bottomSpace: [CGFloat] = [0],
         sideSpace: [CGFloat] = [0],
         separatorHeight: CGFloat = 1,
         footerBackgroundColor: UIColor = UIColor.white,
         separatorColor: UIColor = UIColor.clear,
         text: String = "") {
        
        self.style = style
        self.alignment = alignment
        self.separatorHeight = separatorHeight
        self.footerBackgroundColor = footerBackgroundColor
        self.separatorColor = separatorColor
        self.text = text
        
        switch UIDevice.getDeviceType() {
        case .iPhone_5_5S_5C_SE:
            self.footerHeight = footerHeight[0]
            self.topSpace = topSpace[0]
            self.bottomSpace = bottomSpace[0]
            self.sideSpace = sideSpace[0]
        case .iPhone_6_6S_7_8, .iPhone_6Plus_6SPlus_7Plus_8Plus:
            self.footerHeight = footerHeight.count > 1 ? footerHeight[1] : footerHeight[0]
            self.topSpace = topSpace.count > 1 ? topSpace[1] : topSpace[0]
            self.bottomSpace = bottomSpace.count > 1 ? bottomSpace[1] : bottomSpace[0]
            self.sideSpace = sideSpace.count > 1 ? sideSpace[1] : sideSpace[0]
        case .iPhone_X_Xs, .iPhone_Xr, .iPhone_XsMax:
            self.footerHeight = footerHeight.count == 3 ? footerHeight[2] : footerHeight[0]
            self.topSpace = topSpace.count == 3 ? topSpace[2] : topSpace[0]
            self.bottomSpace = bottomSpace.count == 3 ? bottomSpace[2] : bottomSpace[0]
            self.sideSpace = sideSpace.count == 3 ? sideSpace[2] : sideSpace[0]
        default:
            self.footerHeight = footerHeight[0]
            self.topSpace = topSpace[0]
            self.bottomSpace = bottomSpace[0]
            self.sideSpace = sideSpace[0]
        }
    }
}
