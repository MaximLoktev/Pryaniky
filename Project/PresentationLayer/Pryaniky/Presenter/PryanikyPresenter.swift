//
//  PryanikyPresenter.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

internal protocol PryanikyPresentationLogic {
    func presentLoad(response: PryanikyDataFlow.Load.Response)
}

internal class PryanikyPresenter: PryanikyPresentationLogic {
    
    // MARK: - Properties
    
    weak var viewController: PryanikyControllerLogic?
    
    // MARK: - PryanikyPresentationLogic
    
    func presentLoad(response: PryanikyDataFlow.Load.Response) {
        let viewModel: PryanikyDataFlow.Load.ViewModel
        
        switch response {
        case .success(let result):
            let items: [PryanikyDataFlow.Item] = makeItem(result: result)
            viewModel = .success(items: items)
        case .failure:
            viewModel = .failure(title: NSLocalizedString("Ошибка", comment: ""),
                                 description: NSLocalizedString("Не удалось загрузить данные", comment: ""))
        }
        
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    private func makeItem(result: PryanikyResult) -> [PryanikyDataFlow.Item] {
        var items: [PryanikyDataFlow.Item] = []
        let views = Dictionary(uniqueKeysWithValues: result.data.map { ($0.name, $0.data) })

        result.view.forEach { view in
            guard let data = views[view] else { return }
            var item: PryanikyDataFlow.Item
            
            switch view {
            case .hz:
                guard let text = data.text else { return }
                item = .hz(text: text)
            case .picture:
                guard let url = data.url, let text = data.text else { return }
                item = .picture(url: url, text: text)
            case .selector:
                guard let selectedId = data.selectedId, let variants = data.variants else { return }
                item = .selector(selectedId: selectedId, variants: variants)
            case .unowned:
                return
            }
            
            items.append(item)
        }
        
        return items
    }
}
