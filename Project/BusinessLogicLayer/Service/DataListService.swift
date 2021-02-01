//
//  DataListService.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

import Moya

protocol DataListService {
    func getDataList(completion: @escaping (Result<PryanikyResult, APIError>) -> Void)
}

final class DataListServiceImpl: DataListService {

    // MARK: - Properties
    
    private let provider: MoyaProvider<API.Pryaniky>
    
    private let dataListMapper: DataListMapper
    
    // MARK: - Init
    
    init(provider: MoyaProvider<API.Pryaniky>, dataListMapper: DataListMapper) {
        self.provider = provider
        self.dataListMapper = dataListMapper
    }
    
    func getDataList(completion: @escaping (Result<PryanikyResult, APIError>) -> Void) {
        let query = API.Pryaniky.getDataList
        
        provider.request(query, objectModel: API.Pryaniky.ResultsDataList.self) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let result):
                let mappedDataList = self.dataListMapper.map(result: result)
                completion(.success(mappedDataList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

