//
//  Config.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

import Foundation

final class Config {
    
    static let shared: Config = .init()
    
    let apiUrl: URL = URL(string: "https://pryaniky.com")!
}

