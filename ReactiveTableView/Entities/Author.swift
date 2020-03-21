//
//  Author.swift
//  ReactiveTableView
//
//  Created by Esteban on 21/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import Foundation

public class Author: Codable {
    
    enum AuthorStatus: String, CaseIterable {
        case Beginner
        case Amateur
        case KnowHower = "Know-hower"
        case Expert
        case God
        
        static func getStatus(for rating: Int) -> AuthorStatus {
            return AuthorStatus.allCases[rating]
        }
    }
 
    var id: String? = nil
    var name: String? = nil
    var avatar: String? = nil
    var rating: Int? = nil
}
