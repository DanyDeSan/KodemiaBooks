//
//  DashboardViewController.swift
//  BooksKodemia
//
//  Created by Kodemia on 27/02/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private lazy var sectionsButton: UISegmentedControl = UISegmentedControl(items: viewSections)
    
    private lazy var contentTableView: UITableView = UITableView()
    
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private let apiDataManager: APIDataManager = APIDataManager()
    
    private var booksDataSource: [Book] = [Book]()
    
    private var viewSections: [String] = [Constants.booksString, Constants.authorsString, Constants.categoriesString]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        makeAPIRequest()
        // TODO: Complete UI
    }
    
    func initUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = Constants.dashboardTitleString
    }
    
    func makeAPIRequest() {
        createActivityIndicator()
        apiDataManager.performRequest(endpoint: .books) { [weak self] (response: BooksResponse) in
            self?.removeActivityIndicator()
            self?.booksDataSource = response.data
            self?.completeUI()
        } onError: { [weak self] error in
            self?.removeActivityIndicator()
            print(error)
        }
    }
    
    func createActivityIndicator() {
        self.view.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        activityView.startAnimating()
    }
    
    func removeActivityIndicator() {
        activityView.stopAnimating()
        activityView.removeFromSuperview()
    }
    
    func completeUI() {
        view.addSubview(sectionsButton)
        sectionsButton.selectedSegmentIndex = 0
        sectionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding),
            sectionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            sectionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            sectionsButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        contentTableView.delegate = self
        contentTableView.dataSource = self
        view.addSubview(contentTableView)
        contentTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentTableView.topAnchor.constraint(equalTo: sectionsButton.bottomAnchor, constant: Constants.padding),
            contentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            contentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            contentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding)
        ])
        
    }
    
}

extension DashboardViewController: UITableViewDelegate {
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title: String = booksDataSource[indexPath.row].attributes.title
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = title
        return cell
    }
}
