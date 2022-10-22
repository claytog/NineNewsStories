//
//  ArticleCellViewModel.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 10/10/22.
//

import Foundation

struct ArticleCellViewModel {
    var headline: String
    var abstract: String
    var byLine: String
    var thumbnail: String
    var lastModified: Int
    var articleURL: String
    
    var lastModifiedDate: Date {
        Date(timeIntervalSince1970: TimeInterval(lastModified))
    }
}
