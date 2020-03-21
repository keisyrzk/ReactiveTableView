//
//  GenericTableAction.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Foundation

enum ButtonTypeAction {
    case share
    case more
    case addToDictionary
    case playAudio
    case runRepeats
    
    case addTranslation
    case addExample
    case addComment
    case addPhoto(indexPath: IndexPath)
}

enum TextType {
    case normal
    case listName
    case listDescription
}


indirect enum GenericTableAction {
    
    case DeleteItem(index: IndexPath)
    case Delete(section: Int)
    
    case SelectedAuthor(data: Author)
}
