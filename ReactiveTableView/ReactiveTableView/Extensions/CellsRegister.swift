//
//  CellsRegister.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

extension ReactiveTableView {
    
    // Regular Cella
    static let TextCellID = "TextCell"
    
    func registerCells() {

        // Regular Cella
        self.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: ReactiveTableView.TextCellID)
      
    }
}
