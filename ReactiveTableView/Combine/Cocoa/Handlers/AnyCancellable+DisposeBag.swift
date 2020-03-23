//
//  AnyCancellable+DisposeBag.swift
//  ReactiveTableView
//
//  Created by Esteban on 23/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Combine
import UIKit

extension AnyCancellable: ExtensionProperty {
    
    typealias T = CancellableBag
    
    private struct CustomProperties {
        static var bag = CancellableBag()
    }
    
    private var cancellableBag: CancellableBag {
        get {
            return getAssociatedObject(&CustomProperties.bag, defaultValue: CustomProperties.bag)
        }
        set {
            return objc_setAssociatedObject(self, &CustomProperties.bag, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    func dispose() {
        cancellableBag.add(object: self)
    }
}
