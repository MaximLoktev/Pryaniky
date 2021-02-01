//
//  PryanikyView.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

internal protocol PryanikyViewDelegate: class {

}

internal class PryanikyView: UIView {

    // MARK: - Properties

    weak var delegate: PryanikyViewDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.separatorColor = .darkGray
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 0.0)
        
        tableView.register(cellClass: PryanikyHZCell.self)
        tableView.register(cellClass: PryanikyPictureCell.self)
        tableView.register(cellClass: PryanikySelectorCell.self)
        
        return tableView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        addSubview(tableView)
        
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    func setupLoad(viewModel: PryanikyDataFlow.Load.ViewModel) {

    }
    
    func setupDataManager(dataManager: UITableViewDataSource & UITableViewDelegate) {
        tableView.dataSource = dataManager
        tableView.delegate = dataManager
        tableView.reloadData()
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
