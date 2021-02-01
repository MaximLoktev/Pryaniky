//
//  PryanikyInteractor.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

internal protocol PryanikyBusinessLogic {
    func load(request: PryanikyDataFlow.Load.Request)
}

internal class PryanikyInteractor: PryanikyBusinessLogic {

    // MARK: - Properties

    var presenter: PryanikyPresentationLogic?
    
    private let dataListService: DataListService
    
    // MARK: - Init
    
    init(dataListService: DataListService) {
        self.dataListService = dataListService
    }
    
    // MARK: - PryanikyBusinessLogic

    func load(request: PryanikyDataFlow.Load.Request) {
        dataListService.getDataList { [weak self] result in
            let response: PryanikyDataFlow.Load.Response
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let result):
                response = .success(resultData: result)
            case .failure(let error):
                response = .failure(error: error)
            }
            self.presenter?.presentLoad(response: response)
        }
    }
}
