//
//  TextFooter.swift
//  Spark
//
//  Created by Esteban on 10/12/2019.
//  Copyright © 2019 Selfcode. All rights reserved.
//

import UIKit

class TextFooter: UIView, NibInstantiable {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var bottomSpace: NSLayoutConstraint!
    @IBOutlet weak var leftSpace: NSLayoutConstraint!
    @IBOutlet weak var rightSpace: NSLayoutConstraint!
    
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var topSeparator: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadOwnedNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadOwnedNib()
    }
    
    func configure(footerConfig: FooterConfigData) {
        
        textLabel.text = footerConfig.text
        
        bottomSeparator.backgroundColor = footerConfig.separatorColor
        topSeparator.backgroundColor = footerConfig.separatorColor
        backgroundColor = footerConfig.footerBackgroundColor
        topSpace.constant = footerConfig.topSpace
        bottomSpace.constant = footerConfig.bottomSpace
        leftSpace.constant = footerConfig.sideSpace
        rightSpace.constant = footerConfig.sideSpace
    }
}
