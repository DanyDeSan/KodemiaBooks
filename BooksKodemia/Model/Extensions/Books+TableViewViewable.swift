//
//  Books+TableViewViewable.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 02/03/22.
//

import Foundation

extension Book: ResultViewable {
    var name: String {
        return self.attributes.title
    }
    var dataType: DataType {
        return .Book
    }
    
    var slug: String? {
        return self.attributes.slug
    }
}
