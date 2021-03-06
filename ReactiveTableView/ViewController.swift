//
//  ViewController.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tableView: ReactiveTableView!
    @IBOutlet weak var addB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        handleCombine()
    }


    func setup() {
        
        let sections: [GenericSectionModel] = [
            .WithHeader(title: "Header 1", items: [.TextItem(title: "Header 1 ::: item 1")], footerConfig: FooterConfigData(), headerConfig: HeaderConfigData(style: .simpleText), canEdit: true)
        ]
        tableView.setSections(sections: sections)
        
    }
    
    func handleCombine() {
        
        tableView.customActionsObservable
            .sink(receiveCompletion: { (_) in
            }) { (action) in
                switch action {
                case .DeleteItem(index: let indexPath):
                    print("::: ITEM deleted at \(indexPath)")
                    
                case .Delete(section: let section):
                    print("::: SECTION deleted at \(section)")
                    
                case .SortHeaderChanged(state: let state):
                    print("::: SORT \(state)")
                    
                default:
                    break
                }
        }
        .dispose()
        
        
        addB.tapPublisher.sink { [weak self] (_) in
            self?.tableView.append(items: [.TextItem(title: "Header 1 ::: item \(self!.tableView.sectionsObservable.value[0].items.count + 1)")], toSection: 0)

        }
        .dispose()
    }
    
//    @IBAction func add(_ sender: Any) {
//
//        tableView.append(items: [.TextItem(title: "Header 1 ::: item \(tableView.sectionsObservable.value[0].items.count + 1)")], toSection: 0)
//
////        tableView.insert(item: .TextItem(title: "Header 1  inserted ::: item \(tableView.sectionsObservable.value[0].items.count + 1)"), toSection: 0, at: 0)
//
//    }
    
    @IBAction func addSection(_ sender: Any) {
        
        tableView.append(sections: [GenericSectionModel.WithHeader(title: "Header \(tableView.sectionsObservable.value.count + 1)", items: [GenericSectionItem.TextItem(title: "Header \(tableView.sectionsObservable.value.count + 1) ::: item 1")], footerConfig: FooterConfigData(), headerConfig: HeaderConfigData(style: .sort), canEdit: false)])
        
//        tableView.insert(sections: [.WithHeader(title: "Header \(tableView.sectionsObservable.value.count + 1)", items: [.TextItem(title: "Header \(tableView.sectionsObservable.value.count + 1) ::: item 1")], canEdit: false)], at: 0)
    }
    
    @IBAction func delete1stSection(_ sender: Any) {
        
        tableView.deleteSection(index: 0)
    }
    
}

