//
//  HeaderConfigData.swift
//  Spark
//
//  Created by Esteban on 06/06/2019.
//  Copyright © 2019 Selfcode. All rights reserved.
//

import UIKit

class HeaderConfigData {
    
    enum HeaderStyle {
        case sort
        case simpleText
        case empty
        case underlined
    }
    
    var style: HeaderStyle
    var headerHeight: CGFloat
    var topSpace: CGFloat
    var bottomSpace: CGFloat
    var sideSpace: CGFloat
    var backgroundColor: UIColor
    var fontColor: UIColor
    var showSeparators: [UIRectEdge]
    var separatorColor: UIColor
    
    init(style: HeaderStyle,
         headerHeight: [CGFloat] = [0],
         topSpace: [CGFloat] = [0],
         bottomSpace: [CGFloat] = [0],
         sideSpace: [CGFloat] = [0],
         backgroundColor: UIColor = .clear,
         fontColor: UIColor = UIColor.black,
         showSeparators: [UIRectEdge] = [],
         separatorColor: UIColor = UIColor.black) {
        
        self.style = style
        self.backgroundColor = backgroundColor
        self.fontColor = fontColor
        self.showSeparators = showSeparators
        self.separatorColor = separatorColor
        
        switch UIDevice.getDeviceType() {
        case .iPhone_5_5S_5C_SE:
            self.headerHeight = headerHeight[0]
            self.topSpace = topSpace[0]
            self.bottomSpace = bottomSpace[0]
            self.sideSpace = sideSpace[0]
        case .iPhone_6_6S_7_8, .iPhone_6Plus_6SPlus_7Plus_8Plus:
            self.headerHeight = headerHeight.count > 1 ? headerHeight[1] : headerHeight[0]
            self.topSpace = topSpace.count > 1 ? topSpace[1] : topSpace[0]
            self.bottomSpace = bottomSpace.count > 1 ? bottomSpace[1] : bottomSpace[0]
            self.sideSpace = sideSpace.count > 1 ? sideSpace[1] : sideSpace[0]
        case .iPhone_X_Xs, .iPhone_Xr, .iPhone_XsMax:
            self.headerHeight = headerHeight.count == 3 ? headerHeight[2] : headerHeight[0]
            self.topSpace = topSpace.count == 3 ? topSpace[2] : topSpace[0]
            self.bottomSpace = bottomSpace.count == 3 ? bottomSpace[2] : bottomSpace[0]
            self.sideSpace = sideSpace.count == 3 ? sideSpace[2] : sideSpace[0]
        default:
            self.headerHeight = headerHeight[0]
            self.topSpace = topSpace[0]
            self.bottomSpace = bottomSpace[0]
            self.sideSpace = sideSpace[0]
        }
    }
}
