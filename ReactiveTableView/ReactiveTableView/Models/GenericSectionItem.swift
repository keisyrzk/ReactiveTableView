//
//  GenericSectionItem.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

enum GenericSectionItem {
    // title is HAVE TO BE a unique identifier - to comapre, delete, remove, add items

    // Cells
    case TextItem(title: String)
}

extension GenericSectionItem: Equatable {
    
    var data: Any? {
        switch self {

        default:
            return nil
        }
    }
    
    var title: String {
        switch self {
        case
             .TextItem(title: let title):
            
            return title
        }
    }
    
    var identity: String {
        return title
    }
    
    init(original: GenericSectionItem, id: String) {
        
        switch original {
        case .TextItem(title: _):
            self = .TextItem(title: id)
        }
    }
}

extension GenericSectionItem {
    
    // A method comparing two items more extensively then simple "==", returns false even if the cells are actually the same cell, but the content has changed
    func equalDetailed(to other: GenericSectionItem) -> Bool {
        
        
        if case let GenericSectionItem.TextItem(title: titlel) = other {
            guard case let GenericSectionItem.TextItem(title: titler) = self else {
                return false
            }
            return titlel == titler
        }
                                
        return false
    }
}

// equatable, this is needed to detect changes
func == (lhs: GenericSectionItem, rhs: GenericSectionItem) -> Bool {
    
    switch (lhs, rhs) {

    case (let .TextItem(title: titlel), let .TextItem(title: titler)):
        return titlel == titler
        
//    default:
//        return lhs.identity == rhs.identity
    }
}
