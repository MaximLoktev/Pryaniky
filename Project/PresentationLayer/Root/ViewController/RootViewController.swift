//
//  RootViewController.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

import UIKit

protocol RootModuleOutput: class {
    
}

protocol RootModuleInput: class {
    
}

protocol RootBuilders {
    var pryaniky: PryanikyBuildable { get }
}

final class RootViewController: UINavigationController, RootModuleInput {
    
    // MARK: - Properties

    weak var moduleOutput: RootModuleOutput?
    
    private let appDependency: RootDependency
    
    private let builders: RootBuilders
    
    // MARK: - Init
    
    init(appDependency: RootDependency, builders: RootBuilders) {
        self.appDependency = appDependency
        self.builders = builders

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoading()
    }
    
    // MARK: - RootControllerLogic
    
    private func startLoading() {
        let viewController = builders.pryaniky.build(withModuleOutput: self)
        viewControllers = [viewController]
    }
}

extension RootViewController: PryanikyModuleOutput {
    
}

