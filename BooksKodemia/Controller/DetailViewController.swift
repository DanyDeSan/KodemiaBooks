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
    
    func initUI() {
        view.backgroundColor = .systemBackground
        self.title = Constants.detailViewTitle
    }
    
    func requestDetailInfo() {
        
    }
    
    func completeUI() {
        
    }
}
