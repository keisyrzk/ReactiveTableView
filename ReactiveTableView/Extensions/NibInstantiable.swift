//
//  NibInstantiable.swift
//  ReactiveTableView
//
//  Created by Esteban on 21/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

protocol NibInstantiable: UIView {
    
    /// An outlet to the highest view in a connected nib file.
    var contentView: UIView! { get set }
    
    func loadOwnedNib()
}

extension NibInstantiable {
    
    /**
     This method loads a nib file named as the `UIView` class and assigns its content to a an outlet variable named `contentView`. This variable will be then added to the subview of a `UIView` with its frame set to `UIView`'s bounds.
     
     - important:
        - In corresponding nib file, the file owner has to be set to `UIView`'s class.
        - An Outlet from the nib file's highest view to an instance variable `contentView` has to be set.
     */
    func loadOwnedNib() {
        
        Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
