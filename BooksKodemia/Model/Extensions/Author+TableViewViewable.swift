//
//  Author+TableViewViewable.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 02/03/22.
//

import Foundation

extension Authors: TableViewViewable {
    var name: String {
        return self.attributes.name
    }
    var dataType: DataType {
        return .Author
    }
}
