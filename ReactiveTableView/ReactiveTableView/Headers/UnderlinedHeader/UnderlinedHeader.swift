//
//  UnderlinedHeader.swift
//  Lerni
//
//  Created by Esteban on 21/02/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

class UnderlinedHeader: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var underlineView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func configure(text: String, headerConfig: HeaderConfigData) {
        
        titleLabel.text = text
        titleLabel.textColor = headerConfig.fontColor
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        contentView.backgroundColor = headerConfig.backgroundColor
        underlineView.backgroundColor = headerConfig.separatorColor
    }
    
    private func loadViewFromNib() {
        Bundle.main.loadNibNamed("UnderlinedHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
