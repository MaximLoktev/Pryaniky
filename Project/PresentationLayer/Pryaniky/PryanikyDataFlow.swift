//
//  PryanikyDataFlow.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

internal enum PryanikyDataFlow {
    
    enum Item {
        case hz(text: String)
        case picture(url: String, text: String)
        case selector(selectedId: Int, variants: [Variant])
    }
    
    enum Load {

        struct Request { }

        enum Response {
            case success(resultData: PryanikyResult)
            case failure(error: APIError)
        }
        
        enum ViewModel {
            case success(items: [Item])
            case failure(title: String, description: String)
        }
    }
}
