//
//  APIError.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

enum APIError: Error {
    case network(Error)
    case decoding(Error)
    case internalMessage(String)
}
