//
//  GenericSectionModel.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Foundation

enum GenericSectionModel {
    
    case WithHeader(title: String, items: [GenericSectionItem], canEdit: Bool)
    case WithoutHeader(title: String, items: [GenericSectionItem], canEdit: Bool)  //the header title is used only for comparison purposes, it is not displayed
    
}

extension GenericSectionModel {
    typealias Item = GenericSectionItem
    typealias Identity = String
    
    var identity: String {
        switch self {
        case .WithHeader(title: let title, items: _, canEdit: _),
             .WithoutHeader(title: let title, items: _, canEdit: _):
            return title
        }
    }
    
    var items: [GenericSectionItem] {
        switch  self {
        case .WithHeader(title: _, items: let items, canEdit: _):
            return items.map {$0}
        case .WithoutHeader(title: _, items: let items, canEdit: _):
            return items.map {$0}
        }
    }
    
    init(original: GenericSectionModel, items: [Item]) {
        switch original {
        case let .WithHeader(title: title, items: _, canEdit: canEdit):
            self = .WithHeader(title: title, items: items, canEdit: canEdit)
        case let .WithoutHeader(title: title, items: _, canEdit: canEdit):
            self = .WithoutHeader(title: title, items: items, canEdit: canEdit)
        }
    }
}

extension GenericSectionModel {
    var title: String? {
        switch self {
        case .WithHeader(title: let title, items: _, canEdit: _):
            return title
            
        default:
            return nil
        }
    }
}

extension GenericSectionModel {
    
    var canEdit: Bool {
        switch  self {
        case .WithHeader(title: _, items: _,canEdit: let canEdit):
            return canEdit
        case .WithoutHeader(title: _, items: _, canEdit: let canEdit):
            return canEdit
        }
    }
}

func ==(lhs: GenericSectionModel, rhs: GenericSectionModel) -> Bool {
    return lhs.identity == rhs.identity && lhs.items == rhs.items
}
