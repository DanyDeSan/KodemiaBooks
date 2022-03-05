//
//  DashboardViewController.swift
//  BooksKodemia
//
//  Created by Kodemia on 27/02/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    enum DashboardSection:String, CaseIterable {
        case books = "Books"
        case authors = "Authors"
        case categories = "Categories"
        
        var endpointAssigned: Endpoints {
            switch self {
            case .books: return .books
            case .authors: return .authors
            case .categories: return .categories
            }
        }
    }
    
    /*
        Explanation of the line bellow:
    
    With the map function we aim to transform an array of type
     [DashboardSection] into [String], so we need a closure to do so.
    
    The closure that we use with map is called an anonymous closure. Just
     like a normal closure, it receives every value of the array
     viewSections, but instead of assign a name to that variable we simply
     use a reference $0, which in this context is type of DashboardSection,
     so we can simply use the raw value.
     
     With an anonymous function we can use a single line to do all of our
     operations and the result will be returned.
    
    */
    
    private lazy var sectionsButton: UISegmentedControl = UISegmentedControl(items: viewSections.map{ $0.rawValue })
    
    private lazy var contentTableView: UITableView = UITableView()
    
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private let apiDataManager: APIDataManager = APIDataManager()
    
    private var dataSource: [ResultViewable] = [ResultViewable]()
    
    private var viewSections: [DashboardSection] = DashboardSection.allCases
    
    private var currentSection: DashboardSection = .books

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        requestBooks()
    }
    
    func initUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = Constants.dashboardTitleString
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func requestBooks() {
        createActivityIndicator()
        hideTableView()
        apiDataManager.performRequest(endpoint: .books) { [weak self] (response: BooksResponse) in
            self?.removeActivityIndicator()
            self?.dataSource = response.data
            // If falls into the if let statement, means
            // that the table has already be shown before
            // and it is hidden now
            if let _ = self?.contentTableView.superview {
                self?.showAndReloadTableView()
                return
            }
            self?.completeUI()
        } onError: { [weak self] error in
            self?.removeActivityIndicator()
            print(error)
        }
    }
    
    func requestAuthors() {
        createActivityIndicator()
        hideTableView()
        apiDataManager.performRequest(endpoint: .authors) { [weak self] (response: AuthorsResponse) in
            self?.removeActivityIndicator()
            self?.dataSource = response.data
            // If falls into the if let statement, means
            // that the table has already be shown before
            // and it is hidden now
            if let _ = self?.contentTableView.superview {
                self?.showAndReloadTableView()
                return
            }
            self?.completeUI()
        } onError: { [weak self] error in
            self?.removeActivityIndicator()
            print(error)
        }
    }
    
    func requestCategories() {
        createActivityIndicator()
        hideTableView()
        apiDataManager.performRequest(endpoint: .categories) { [weak self] (response: CategoriesResponse) in
            self?.removeActivityIndicator()
            self?.dataSource = response.data
            // If falls into the if let statement, means
            // that the table has already be shown before
            // and it is hidden now
            if let _ = self?.contentTableView.superview {
                self?.showAndReloadTableView()
                return
            }
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
    
    func hideTableView() {
        contentTableView.isHidden = true
    }
    
    func showAndReloadTableView() {
        contentTableView.isHidden = false
        contentTableView.reloadData()
    }
    
    func completeUI() {
        view.addSubview(sectionsButton)
        sectionsButton.selectedSegmentIndex = 0
        sectionsButton.translatesAutoresizingMaskIntoConstraints = false
        sectionsButton.backgroundColor = .kodemiaCyanFaded
        sectionsButton.selectedSegmentTintColor = .kodemiaCyan
        sectionsButton.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        sectionsButton.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        
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
        contentTableView.isHidden = false
        NSLayoutConstraint.activate([
            contentTableView.topAnchor.constraint(equalTo: sectionsButton.bottomAnchor, constant: Constants.padding),
            contentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            contentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            contentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding)
        ])
        
        contentTableView.layer.borderColor = UIColor.kodemiaCyan.cgColor
        contentTableView.layer.borderWidth = Constants.borderWidth
        contentTableView.layer.cornerRadius = Constants.cornerRadius
        contentTableView.layer.masksToBounds = true
        sectionsButton.addTarget(self, action: #selector(sectionDidChanged(_:)), for: .valueChanged)
        navigationItem.setRightBarButtonItems([UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.dismissView))], animated: true)
    }
    
    @objc func sectionDidChanged(_ sender: UISegmentedControl) {
        let indexSelection: Int = sender.selectedSegmentIndex
        currentSection = viewSections[indexSelection]
        switch indexSelection {
        case 0:
            requestBooks()
        case 1:
            requestAuthors()
        case 2:
            requestCategories()
        default:
            break
        }
    }
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model: ResultViewable = dataSource[indexPath.row]
        let detailView: DetailViewController = DetailViewController()
        detailView.viewableResultFromDashboard = model
        navigationController?.pushViewController(detailView, animated: true)
    }
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title: String = dataSource[indexPath.row].name
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = title
        let backgroundColorView: UIView = UIView()
        backgroundColorView.backgroundColor = .kodemiaCyanFaded
        cell.selectedBackgroundView = backgroundColorView
        return cell
    }
}
