//
//  TextCell.swift
//  Lerni
//
//  Created by Esteban on 19/02/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    

    func configure(text: String) {
                
        self.selectionStyle = .none
        
        titleLabel.text = text
        titleLabel.textColor = UIColor.blue
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}
