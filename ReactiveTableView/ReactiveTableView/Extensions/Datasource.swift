//
//  Datasource.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

extension ReactiveTableView: UITableViewDataSource {
    
    func setSections(sections: [GenericSectionModel]) {
        sectionsObservable.send(sections)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsObservable.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsObservable.value[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sectionsObservable.value[indexPath.section].items[indexPath.item] {

        case let .TextItem(title: title):
            let cell = tableView.dequeueReusableCell(withIdentifier: ReactiveTableView.TextCellID, for: indexPath) as! TextCell
            cell.configure(text: title)

            return cell
        }
    }
}
