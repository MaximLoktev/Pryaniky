//
//  AppDependency.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

import Moya

protocol RootDependency {
    var dataListService: DataListService { get }
    var dataListProvider: MoyaProvider<API.Pryaniky> { get }
    var dataListMapper: DataListMapper { get }
}

final class AppDependency: RootDependency {
    
    private(set) lazy var dataListProvider: MoyaProvider<API.Pryaniky> = MoyaProvider<API.Pryaniky>()
    
    private(set) lazy var dataListMapper: DataListMapper = DataListMapperImpl()
    
    private(set) lazy var dataListService: DataListService = DataListServiceImpl(provider: dataListProvider,
                                                                                 dataListMapper: dataListMapper)
}
