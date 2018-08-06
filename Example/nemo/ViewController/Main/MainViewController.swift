//
//  MainViewController.swift
//  nemo
//
//  Created by Andyy Hope on 21/7/18.
//  Copyright © 2018 Andyy Hope. All rights reserved.
//

import UIKit

extension MainViewController {
    typealias DataSource = MainViewDataSource
    typealias Model = MainViewModel
}

final class MainViewController: UIViewController, ErrorPresenting, CellControllerDisplayable, SectionControllerDisplayable {
    
    // MARK: - Properties
    
    private var dataSource: DataSource = DataSource()
    private var tableView: UITableView = UITableView()
    
    // MARK: - Computed Properties
    
    private var model: Model {
        return dataSource.model
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareViewController()
        prepareTableView()
        
        dataSource.request(.initial) { [weak self] result in
            switch result {
            case .loading:
                break
            case .completed:
                self?.tableView.reloadData()
            case .failed(let failure):
                self?.presentError(withMessage: failure.description)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    // MARK: - Preparation
    
    private func prepareViewController() {
        title = model.title
    }
    
    private func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = model.backgroundColor
        
        
        
        view.addSubview(tableView)
        registerCells(for: tableView)
        registerViews(for: tableView)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    // MARK: Data
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(dataSource.numberOfSections)
        return dataSource.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRows(inSection: section)
    }
    
    
    // MARK: Titles
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }

    
    // MARK: Cells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellController = dataSource.cellController(for: indexPath)
        return self.tableView(tableView, cellFor: cellController, at: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    // MARK: Height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellController = dataSource.cellController(for: indexPath)
        return self.tableView(tableView, cellHeightFor: cellController)
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellController = dataSource.cellController(for: indexPath)
        return self.tableView(tableView, estimatedCellHeightFor: cellController)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionController = dataSource.sectionController(forIndex: section)
        return self.tableView(tableView, sectionHeaderHeightFor: sectionController)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionController = dataSource.sectionController(forIndex: section)
        return self.tableView(tableView, sectionFooterHeightFor: sectionController)
    }
    
    
    // MARK: View
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionController = dataSource.sectionController(forIndex: section)
        return self.tableView(tableView, headerViewFor: sectionController, atIndex: section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionController = dataSource.sectionController(forIndex: section)
        return self.tableView(tableView, footerViewFor: sectionController, atIndex: section)
    }
}
