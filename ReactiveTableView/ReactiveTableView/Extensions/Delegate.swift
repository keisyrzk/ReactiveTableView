//
//  Delegate.swift
//  ReactiveTableView
//
//  Created by Esteban on 21/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit
import Combine

extension ReactiveTableView {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = sectionsObservable.value[indexPath.section].items[indexPath.row]
        
        if let author = item.data as? Author {
            customActionsObservable.send(.SelectedAuthor(data: author))
        }
    }
}
