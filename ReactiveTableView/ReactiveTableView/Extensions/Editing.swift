//
//  Editing.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

extension ReactiveTableView {
    
    //MARK: EDITING
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return sectionsObservable.value[indexPath.section].canEdit
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            deleteItem(indexPath: indexPath)
        default:
            break
        }
    }
    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return sectionsObservable.value[indexPath.section].canMove
//    }
    
    //MARK: Append
    func append(items: [GenericSectionItem], toSection: Int) {

        var sections = sectionsObservable.value
        let items = sections[toSection].items + items
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            sections[toSection] = GenericSectionModel(original: sections[toSection], items: items)
            self?.sectionsObservable.send(sections)
            self?.insertRows(at: [IndexPath(row: sections[toSection].items.count - 1, section: toSection)], with: self!.appendItemsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    func append(sections: [GenericSectionModel]) {
        
        var currentSections = sectionsObservable.value
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            currentSections += sections
            self?.sectionsObservable.send(currentSections)
            self?.insertSections(IndexSet(arrayLiteral: currentSections.count - 1), with: self!.appendSectionsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    //MARK: Insert
    func insert(sections: [GenericSectionModel], at index: Int) {
        
        var currentSections = sectionsObservable.value
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            currentSections.insert(contentsOf: sections, at: index)
            self?.sectionsObservable.send(currentSections)
            self?.insertSections(IndexSet(arrayLiteral: index), with: self!.insertSectionsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    func insert(item: GenericSectionItem, toSection: Int, at: Int) {
        
        var sections = sectionsObservable.value
        var items = sections[toSection].items
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            items.insert(item, at: at)
            sections[toSection] = GenericSectionModel(original: sections[toSection], items: items)
            self?.sectionsObservable.send(sections)
            self?.insertRows(at: [IndexPath(row: at, section: toSection)], with: self!.insertItemsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    //MARK: Update
    func updateSection(index: Int, with items: [GenericSectionItem]) {
        
        var sections = sectionsObservable.value
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            sections[index] = GenericSectionModel(original: sections[index], items: items)
            self?.sectionsObservable.send(sections)
            self?.reloadSections(IndexSet(arrayLiteral: index), with: self!.updateSectionsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    func updateSection(index: Int, with sectionData: GenericSectionModel) {
        
        var sections = sectionsObservable.value
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            sections[index] = sectionData
            self?.sectionsObservable.send(sections)
            self?.reloadSections(IndexSet(arrayLiteral: index), with: self!.updateSectionsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    //MARK: Set
    func set(item: GenericSectionItem, at index: IndexPath) {
        
        if sectionsObservable.value[index.section].items[index.item].equalDetailed(to: item) {
            return
        }
        
        var sections = sectionsObservable.value
        var mutableItems = sections[index.section].items
        mutableItems[index.item] = item
        sections[index.section] = GenericSectionModel(original: sections[index.section], items: mutableItems)
        self.sectionsObservable.send(sections)
    }
    
    
    //MARK: Delete
    func deleteSection(index: Int) {
        var sections = sectionsObservable.value
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            if sections.count > index {
                sections.remove(at: index)
            }
            self?.sectionsObservable.send(sections)
            self?.customActionsObservable.send(.Delete(section: index))
            self?.deleteSections(IndexSet(arrayLiteral: index), with: self!.deleteSectionAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    func deleteSections(fromIndex: Int) {
        var sections = sectionsObservable.value
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.beginUpdates()
            sections.removeSubrange(fromIndex..<sections.count)
            self?.sectionsObservable.send(sections)
            self?.deleteSections(IndexSet(integersIn: fromIndex..<sections.count), with: self!.deleteSectionsAnimation)
            self?.endUpdates()
        }
        CATransaction.commit()
    }
    
    func deleteItem(indexPath: IndexPath) {
        
        customActionsObservable.send(.DeleteItem(index: indexPath))
        var sections = sectionsObservable.value
        var items = sections[indexPath.section].items
        
        if items.count == 1 {
            deleteSection(index: indexPath.section)
            reloadData()
        }
        else {
            CATransaction.begin()
            CATransaction.setCompletionBlock { [weak self] in
                self?.beginUpdates()
                items.remove(at: indexPath.row)
                sections[indexPath.section] = GenericSectionModel(original: sections[indexPath.section], items: items)
                self?.sectionsObservable.send(sections)
                self?.deleteRows(at: [indexPath], with: self!.deleteItemAnimation)
                self?.endUpdates()
            }
            CATransaction.commit()
        }
                
        if sectionsObservable.value.count < sections.count {
            customActionsObservable.send(.Delete(section: indexPath.section))
        }
    }
}
