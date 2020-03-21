//
//  Scrolling.swift
//  ReactiveTableView
//
//  Created by Esteban on 21/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Combine
import UIKit

extension ReactiveTableView {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            // did move up
            tableDidScrollObservable.send((scrollView: scrollView, direction: .up))
            
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            // did move down
            tableDidScrollObservable.send((scrollView: scrollView, direction: .down))
        } else {
            // didn't move
            tableDidScrollObservable.send((scrollView: scrollView, direction: .noMove))
        }
    }
    
    func scrollToBottom()  {
        let point = CGPoint(x: 0, y: self.contentSize.height + self.contentInset.bottom - self.frame.height)
        if point.y >= 0{
            self.setContentOffset(point, animated: true)
        }
    }
}
