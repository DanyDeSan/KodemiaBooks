//
//  Parser.swift
//  BooksKodemia
//
//  Created by Kodemia on 27/02/22.
//

import Foundation

class DataParser<DataExpected: Codable> {
    lazy var decoder: JSONDecoder = JSONDecoder()
    func parseData(data: Data) -> DataExpected? {
        do {
            let dataDecode: DataExpected = try decoder.decode(DataExpected.self, from: data)
            return dataDecode
        } catch {
            print(error)
            return nil
        }
    }
}
