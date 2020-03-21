//
//  GenericSectionModel.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Foundation

enum GenericSectionModel {
    
    case WithHeader(title: String, items: [GenericSectionItem], footerConfig: FooterConfigData, headerConfig: HeaderConfigData, canEdit: Bool)
    case WithoutHeader(title: String, items: [GenericSectionItem], footerConfig: FooterConfigData, canEdit: Bool)  //the header title is used only for comparison purposes, it is not displayed
    
}

extension GenericSectionModel {
    typealias Item = GenericSectionItem
    typealias Identity = String
    
    var identity: String {
        switch self {
        case .WithHeader(title: let title, items: _, footerConfig: _, headerConfig: _, canEdit: _),
             .WithoutHeader(title: let title, items: _, footerConfig: _, canEdit: _):
            return title
        }
    }
    
    var items: [GenericSectionItem] {
        switch  self {
        case .WithHeader(title: _, items: let items, footerConfig: _, headerConfig: _, canEdit: _):
            return items.map {$0}
        case .WithoutHeader(title: _, items: let items, footerConfig: _, canEdit: _):
            return items.map {$0}
        }
    }
    
    init(original: GenericSectionModel, items: [Item]) {
        switch original {
        case let .WithHeader(title: title, items: _, footerConfig: footerConfig, headerConfig: headerConfig, canEdit: canEdit):
            self = .WithHeader(title: title, items: items, footerConfig: footerConfig, headerConfig: headerConfig, canEdit: canEdit)
        case let .WithoutHeader(title: title, items: _, footerConfig: footerConfig, canEdit: canEdit):
            self = .WithoutHeader(title: title, items: items, footerConfig: footerConfig, canEdit: canEdit)
        }
    }
}

extension GenericSectionModel {
    var title: String? {
        switch self {
        case .WithHeader(title: let title, items: _, footerConfig: _, headerConfig: _, canEdit: _):
            return title
            
        default:
            return nil
        }
    }
}

extension GenericSectionModel {
    
    var footerConfig: FooterConfigData {
        switch  self {
        case .WithHeader(title: _, items: _, footerConfig: let footerConfig, headerConfig: _, canEdit: _):
            return footerConfig
        case .WithoutHeader(title: _, items: _, footerConfig: let footerConfig, canEdit: _):
            return footerConfig
        }
    }
    
    var headerConfig: HeaderConfigData? {
        switch  self {
        case .WithHeader(title: _, items: _, footerConfig: _, headerConfig: let headerConfig, canEdit: _):
            return headerConfig
        default:
            return nil
        }
    }
    
    var canEdit: Bool {
        switch  self {
        case .WithHeader(title: _, items: _, footerConfig: _, headerConfig: _, canEdit: let canEdit):
            return canEdit
        case .WithoutHeader(title: _, items: _, footerConfig: _, canEdit: let canEdit):
            return canEdit
        }
    }
}

func ==(lhs: GenericSectionModel, rhs: GenericSectionModel) -> Bool {
    return lhs.identity == rhs.identity && lhs.items == rhs.items
}
