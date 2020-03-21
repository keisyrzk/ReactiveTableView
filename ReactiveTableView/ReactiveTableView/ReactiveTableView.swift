//
//  ReactiveTableView.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit
import Combine

class ReactiveTableView: UITableView, UITableViewDelegate {
    
    enum ScrollingDirection {
        case up
        case down
        case noMove
    }
    
    //MARK: Animations
    
    var deleteItemAnimation: UITableView.RowAnimation = .left
    var deleteSectionAnimation: UITableView.RowAnimation = .left
    var deleteSectionsAnimation: UITableView.RowAnimation = .left
    
    var appendItemsAnimation: UITableView.RowAnimation = .left
    var appendSectionsAnimation: UITableView.RowAnimation = .left
    
    var insertItemsAnimation: UITableView.RowAnimation = .left
    var insertSectionsAnimation: UITableView.RowAnimation = .left
    
    var updateItemsAnimation: UITableView.RowAnimation = .fade
    var updateSectionsAnimation: UITableView.RowAnimation = .fade
    
    
    //MARK: Attributes
    
    var sectionsObservable = CurrentValueSubject<[GenericSectionModel], Error>([])
    var customActionsObservable = PassthroughSubject<GenericTableAction, Error>()
    @Published var tableDidScrollObservable: ScrollViewInfo? = nil

    typealias ScrollViewInfo = (scrollView: UIScrollView, direction: ScrollingDirection)
    typealias HeaderInfo = (view: UIView, section: Int)
    var headers: [HeaderInfo] = []
    var lastContentOffset: CGFloat = 0
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 140
        
        self.delegate = self
        
        registerCells()
        setupTable()
    }
    
    private func setupTable() {
        
        self.delegate = self
        self.dataSource = self
        
        self.keyboardDismissMode = .onDrag
//        sectionsObservable.sink(receiveCompletion: { (_) in
//        }) { [weak self] (_) in
////            self?.reloadData()
//        }
//        .dispose()
    }
}
