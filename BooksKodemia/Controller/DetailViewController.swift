//
//  DetailViewController.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 02/03/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewableResultFromDashboard: ResultViewable?
    private var fetchedResult: ResultViewable?
    
    private var apiDataManager: APIDataManager = APIDataManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        requestDetailInfo()
    }
    
    private func initUI() {
        view.backgroundColor = .systemBackground
        self.title = Constants.detailViewTitle
    }
    
    private func requestDetailInfo() {
        guard let model: ResultViewable = viewableResultFromDashboard else { return }
        switch model.dataType {
        case .Category: requestCategoryDetail()
        case .Book: requestBookDetail()
        case .Author: requestAuthorDetail()
        }
        
    }
    
    private func requestBookDetail() {
        guard let slug: String = viewableResultFromDashboard?.slug else { return }
        apiDataManager.performRequest(endpoint: .singleBooks(bookSlug: slug)) { (dataResponse: SingleBookResponse) in
            print(dataResponse)
        } onError: { error in
            print(error)
        }

    }
    
    private func requestCategoryDetail() {
        guard let id: String = viewableResultFromDashboard?.id else { return }
        apiDataManager.performRequest(endpoint: .singleCategory(categoryID: id)) { (category: SingleCategoryResponse) in
            print(category)
        } onError: { error in
            print(error)
        }
    }
    
    private func requestAuthorDetail() {
        guard let id: String = viewableResultFromDashboard?.id else { return }
        apiDataManager.performRequest(endpoint: .singleAuthor(authorID: id)) { (category: SingleAuthorResponse) in
            print(category)
        } onError: { error in
            print(error)
        }
    }
    
    func completeUI() {
        
    }
}
