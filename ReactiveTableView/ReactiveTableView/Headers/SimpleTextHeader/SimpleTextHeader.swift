//
//  SimpleTextHeader.swift
//  Spark
//
//  Created by Esteban on 13/05/2019.
//  Copyright © 2019 Selfcode. All rights reserved.
//

import UIKit

class SimpleTextHeader: UIView {

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
        
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func configure(text: String, headerConfig: HeaderConfigData) {
        
        textLabel.text = text
        
        backgroundColor = headerConfig.backgroundColor
        topSpace.constant = headerConfig.topSpace
        bottomSpace.constant = headerConfig.bottomSpace
        leftSpace.constant = headerConfig.sideSpace
        rightSpace.constant = headerConfig.sideSpace
        
        bottomSeparator.backgroundColor = .clear
        topSeparator.backgroundColor = .clear
        if !headerConfig.showSeparators.isEmpty {
            
            if headerConfig.showSeparators.contains(.top) {
                topSeparator.backgroundColor = headerConfig.separatorColor
            }
            if headerConfig.showSeparators.contains(.bottom) {
                bottomSeparator.backgroundColor = headerConfig.separatorColor
            }
            if headerConfig.showSeparators.contains(.all) {
                topSeparator.backgroundColor = headerConfig.separatorColor
                bottomSeparator.backgroundColor = headerConfig.separatorColor
            }
        }
    }
    
    private func loadViewFromNib() {
        Bundle.main.loadNibNamed("SimpleTextHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
