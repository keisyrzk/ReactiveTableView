//
//  SortHeader.swift
//  Spark
//
//  Created by Esteban on 10/05/2019.
//  Copyright © 2019 Selfcode. All rights reserved.
//

import UIKit
import Combine

class SortHeader: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var sortButton: UIButton!
    
    @IBOutlet weak var titleLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewRightConstraint: NSLayoutConstraint!
    
    let isSorted = CurrentValueSubject<Bool, Error>(false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    func refresh(state: Bool) {
        isSorted.send(state)
        setupTextAndIcon(state: state)
    }

    func configure(state: Bool) -> AnyPublisher<Bool, Error> {
        
        refresh(state: state)
        
        titleLeftConstraint.constant = 20
        titleTopConstraint.constant = 16
        titleBottomConstraint.constant = 5
        stackViewRightConstraint.constant = 20
  
        titleLabel.text = "Sortuj"
        
        layoutSubviews()
        layoutIfNeeded()
        
        sortButton.tapPublisher.sink { [weak self] (_) in
            self?.isSorted.send(!self!.isSorted.value)
            self?.setupTextAndIcon(state: self!.isSorted.value)
        }
        .dispose()
        
//        sortButton
//            .publisher(for: .touchUpInside)
//            .sink { [weak self] (_) in
//                self?.isSorted.send(!self!.isSorted.value)
//                self?.setupTextAndIcon(state: self!.isSorted.value)
//        }
//        .dispose()
        
        return isSorted.eraseToAnyPublisher()
    }
    
    private func setupTextAndIcon(state: Bool) {
        let sortText = state == true ? "Brak" : "Sortuj"
        sortLabel.text = sortText
        iconImageView.image = state == true ? UIImage(named: "cancelX") : UIImage(named: "sortIcon")
    }
    
    private func loadViewFromNib() {
        Bundle.main.loadNibNamed("SortHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
