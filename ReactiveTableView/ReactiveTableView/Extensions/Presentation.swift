//
//  Presentation.swift
//  ReactiveTableView
//
//  Created by Esteban on 21/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit
import Combine

extension ReactiveTableView {
    
    //presentation
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionsObservable.value[section].footerConfig.footerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let footerConfig = sectionsObservable.value[section].footerConfig

        switch footerConfig.style {
            
        case .separator:
            let footer = SeparatorFooter(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: footerConfig.footerHeight))
            footer.configure(data: footerConfig)
            return footer
            
        case .text:
            let footer = TextFooter(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: footerConfig.footerHeight))
            footer.configure(footerConfig: footerConfig)
            return footer
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let section = sectionsObservable.value[section]
        guard let headerStyle = section.headerConfig?.style else {return}
        
        switch headerStyle {

        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionItem = sectionsObservable.value[section]
        guard let headerConfig = sectionItem.headerConfig else {
            let vw = UIView()
            vw.backgroundColor = UIColor.clear
            return vw
        }
        
        switch headerConfig.style {
            
        case .sort:
            
            var state = false
            if let info = headers.first(where: { $0.section == section }) {
                state = (info.view as! SortHeader).isSorted.value
            }
                        
            let header = SortHeader()
            
            header.configure(state: state)
                .sink(receiveCompletion: { (_) in
                }) { [weak self] (state) in
                    if self!.headers.contains(where: { $0.section == section }) {
                        self?.headers.remove(at: section)
                        self?.headers.append((header, section))
                    }
                    else {
                        self?.headers.append((header, section))
                    }
                    
                    self?.customActionsObservable.send(.SortHeaderChanged(state: state))
            }
            
            return header
            
        case .simpleText:
            let header = SimpleTextHeader()
            header.configure(text: sectionItem.title ?? "", headerConfig: headerConfig)
            return header
            
            
        case .underlined:
            let header = UnderlinedHeader()
            header.configure(text: sectionItem.title ?? "", headerConfig: headerConfig)
            return header
            
        case .empty:
            let header = SimpleTextHeader()
            header.configure(text: "", headerConfig: headerConfig)
            return header
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = sectionsObservable.value[section]
        guard let headerConfig = section.headerConfig else {return 1}
        switch headerConfig.style {
            
        case .sort:
            return 44
            
        case .simpleText:
            return headerConfig.headerHeight
        case .empty:
            return headerConfig.headerHeight
            
        default:
            return 40
        }
    }
}
