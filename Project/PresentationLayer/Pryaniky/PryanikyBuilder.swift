//
//  PryanikyBuilder.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

internal protocol PryanikyBuildable {
    func build(withModuleOutput output: PryanikyModuleOutput) -> UIViewController & PryanikyModuleInput
}

internal class PryanikyBuilder: PryanikyBuildable {

    // MARK: - Properties

    private let dataListService: DataListService

    // MARK: - Init

    init(dataListService: DataListService) {
        self.dataListService = dataListService
    }

    // MARK: - PryanikyBuildable
    
    func build(withModuleOutput output: PryanikyModuleOutput) -> UIViewController & PryanikyModuleInput {
        let viewController = PryanikyViewController()
        let interactor = PryanikyInteractor(dataListService: dataListService)
        let presenter = PryanikyPresenter()
        viewController.interactor = interactor
        viewController.moduleOutput = output
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }

}
