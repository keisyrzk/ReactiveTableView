//
//  ExtensionProperty.swift
//  Lerni
//
//  Created by Esteban on 16/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Foundation

protocol ExtensionProperty {
    
    associatedtype T
    
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
}

extension ExtensionProperty {
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
}
