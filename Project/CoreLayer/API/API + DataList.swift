//
//  API + DataList.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

import Moya

enum API {
    
    enum Pryaniky: TargetType {
        
        case getDataList
        
        var baseURL: URL {
            return Config.shared.apiUrl
        }
        
        var path: String {
            switch self {
            case .getDataList:
                return "/static/json/sample.json"
            }
        }
        
        var method: Moya.Method {
            switch self {
            case .getDataList:
                return .get
            }
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case .getDataList:
                return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            return nil
        }
    }
}

extension API.Pryaniky {
    
    struct ResultsDataList: Codable {
        let data: [DataList]
        let view: [String]
    }
    
    struct DataList: Codable {
        let name: String
        let data: DataListDetail
    }
    
    struct DataListDetail: Codable {
        let text: String?
        let url: String?
        let selectedId: Int?
        let variants: [Variant]?
    }
    
    struct Variant: Codable {
        let id: Int
        let text: String
    }
}
