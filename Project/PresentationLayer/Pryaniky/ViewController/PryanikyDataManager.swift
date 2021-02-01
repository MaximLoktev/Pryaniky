//
//  PryanikyDataManager.swift
//  Pryaniky
//
//  Created by Максим Локтев on 01.02.2021.
//

import UIKit

final class PryanikyDataManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    var items: [PryanikyDataFlow.Item] = []
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.item]
        
        switch item {
        case .hz(let text):
            let cell = tableView.dequeueReusableCell(withClass: PryanikyHZCell.self, forIndexPath: indexPath)
            cell.setupCell(text: text)
            return cell
        case let .picture(url, text):
            let cell = tableView.dequeueReusableCell(withClass: PryanikyPictureCell.self, forIndexPath: indexPath)
            cell.setupCell(url: url, text: text)
            return cell
        case let .selector(selectedId, variants):
            let cell = tableView.dequeueReusableCell(withClass: PryanikySelectorCell.self, forIndexPath: indexPath)
            cell.setupCell(selector: selectedId, variants: variants)
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.item]
        
        switch item {
        case .hz:
            return 44.0
        case .picture:
            return 200.0
        case .selector:
            return 100.0
        }
    }
}
