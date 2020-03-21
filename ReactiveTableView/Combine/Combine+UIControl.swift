//
//  Combine+UIControl.swift
//  Lerni
//
//  Created by Esteban on 16/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit
import Combine

/// Extending the `UIControl` types to be able to produce a `UIControl.Event` publisher.
protocol CombineCompatible { }

extension UIControl: CombineCompatible { }

extension CombineCompatible where Self: UIControl {
    func publisher(for events: UIControl.Event) -> UIControlPublisher<UIControl> {
        return UIControlPublisher(control: self, events: events)
    }
}
