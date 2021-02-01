//
//  RootBuilder.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

import UIKit

protocol RootBuildable {
    func build(withModuleOutput output: RootModuleOutput?) -> UINavigationController & RootModuleInput
}

private struct Builders: RootBuilders {
    var pryaniky: PryanikyBuildable
}

final class RootBuilder: RootBuildable {
    
    // MARK: - Properties
    
    let dependency: RootDependency
    
    // MARK: - Init
    
    init(dependency: RootDependency) {
        self.dependency = dependency
    }
    
    // MARK: - RootBuildable
    
    func build(withModuleOutput output: RootModuleOutput?) -> UINavigationController & RootModuleInput {
        let builders = Builders(pryaniky: PryanikyBuilder(dataListService: dependency.dataListService))
        
        let viewController = RootViewController(appDependency: dependency, builders: builders)
        return viewController
    }
}
