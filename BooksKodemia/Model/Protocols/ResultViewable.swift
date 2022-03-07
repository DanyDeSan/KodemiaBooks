//
//  TableViewViewable.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 02/03/22.
//

import Foundation

protocol ResultViewable {
    var name: String { get }
    var id: String { get }
    var dataType: DataType { get }
    var slug: String? { get }
}
