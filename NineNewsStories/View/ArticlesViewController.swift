//
//  ArticlesViewController.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 10/10/22.
//

import UIKit

class ArticlesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var activityIndicator = UIActivityIndicatorView(style: .large)

    var selectedURLString: String!

    lazy var viewModel = {
        ArticlesViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Nine News Stories"
        
        initActivityIndicator()
        initTableView()
        initViewModel()
    }

    func initActivityIndicator(){
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func initTableView() {

        // TableView customisation
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(ArticleCell.nib, forCellReuseIdentifier: ArticleCell.identifier)
    }

    func initViewModel() {
        viewModel.getArticles()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webViewSegue"
        {
            if let destinationVC = segue.destination as? ArticleDetailsViewController {
                destinationVC.urlString = selectedURLString
            }
        }
    }
}
// MARK: - UITableViewDelegate

extension ArticlesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedURLString = viewModel.articleCellViewModels[indexPath.row].articleURL
        self.performSegue(withIdentifier: "webViewSegue", sender: nil)
    }
}

// MARK: - UITableViewDataSource

extension ArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as? ArticleCell else { fatalError("xib does not exist") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.selectionStyle = .none

        return cell
    }
}
