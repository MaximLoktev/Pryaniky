//
//  PryanikyViewController.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

internal protocol PryanikyControllerLogic: class {
    func displayLoad(viewModel: PryanikyDataFlow.Load.ViewModel)
}

internal protocol PryanikyModuleOutput: class {

}

internal protocol PryanikyModuleInput: class {

}

internal class PryanikyViewController: UIViewController,
    PryanikyControllerLogic, PryanikyModuleInput, PryanikyViewDelegate {

    // MARK: - Properties

    var interactor: PryanikyBusinessLogic?

    weak var moduleOutput: PryanikyModuleOutput?

    var moduleView: PryanikyView!
    
    private let dataManager = PryanikyDataManager()

    // MARK: - View life cycle

    override func loadView() {
        moduleView = PryanikyView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString("Пряники", comment: "")
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
    
        startLoading()
    }

    // MARK: - PryanikyControllerLogic

    private func startLoading() {
        IndicatorAlertController.show()
        let request = PryanikyDataFlow.Load.Request()
        interactor?.load(request: request)
    }

    func displayLoad(viewModel: PryanikyDataFlow.Load.ViewModel) {
        IndicatorAlertController.hide()
        switch viewModel {
        case .success(let items):
            dataManager.items = items
            moduleView.setupDataManager(dataManager: dataManager)
        case let .failure(title, description):
            let alert = AlertWindowController.alert(title: title,
                                                    message: description,
                                                    cancel: NSLocalizedString("Ok", comment: ""))
            alert.show()
        }
        
        moduleView.setupLoad(viewModel: viewModel)
    }

}
