//
//  SeparatorFooter.swift
//  Spark
//
//  Created by Esteban on 20/05/2019.
//  Copyright © 2019 Selfcode. All rights reserved.
//

import UIKit

class SeparatorFooter: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(data: FooterConfigData) {
        
        let separator = UIView()
        separator.backgroundColor = data.separatorColor
        self.addSubview(separator)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = separator.heightAnchor.constraint(equalToConstant: data.separatorHeight)
        let leftConstraint = separator.leftAnchor.constraint(equalTo: self.leftAnchor)
        let rightConstraint = separator.rightAnchor.constraint(equalTo: self.rightAnchor)
        
        var alignmentConstraint: NSLayoutConstraint
        
        switch data.alignment {
        case .top:
            alignmentConstraint = separator.topAnchor.constraint(equalTo: self.topAnchor)
        case .center:
            alignmentConstraint = separator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        case .bottom:
            alignmentConstraint = separator.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        }
        
        self.addConstraints([heightConstraint, leftConstraint, rightConstraint, alignmentConstraint])
        
        self.backgroundColor = data.footerBackgroundColor
    }
}
