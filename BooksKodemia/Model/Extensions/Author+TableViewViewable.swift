//
//  Author+TableViewViewable.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 02/03/22.
//

import Foundation

extension Authors: ResultViewable {
    var slug: String? {
        return nil
    }
    
    var name: String {
        return self.attributes.name
    }
    var dataType: DataType {
        return .Author
    }
    
    var content: String? {
        return nil
    }
}
