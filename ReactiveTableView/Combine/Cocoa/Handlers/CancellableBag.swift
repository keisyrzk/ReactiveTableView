//
//  CancellableBag.swift
//  Lerni
//
//  Created by Esteban on 16/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Combine
import Foundation

class CancellableBag {
    
    private var bag = Set<AnyCancellable>()
    
    func add(object: AnyCancellable) {
        bag.insert(object)
    }
}
