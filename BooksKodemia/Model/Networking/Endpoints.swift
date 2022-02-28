//
//  Endpoints.swift
//  BooksKodemia
//
//  Created by Kodemia on 27/02/22.
//

import Foundation


enum Endpoints {
    case authors
    case categories
    case books
    
    private var baseURL: URLComponents {
        var baseURL: URLComponents = URLComponents()
        baseURL.host = "playground-bookstore.herokuapp.com"
        baseURL.scheme = "https"
        baseURL.path = "/api/v1/"
        return baseURL
    }
    
    var completeURL: URL? {
        switch self {
        case .authors:
            var baseURL: URLComponents = baseURL
            baseURL.path += "authors"
            return baseURL.url
        case .categories:
            var baseURL: URLComponents = baseURL
            baseURL.path += "categories"
            return baseURL.url
        case .books:
            var baseURL:URLComponents = baseURL
            baseURL.path += "books"
            return baseURL.url
        }
    }
}
