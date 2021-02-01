//
//  DataList.swift
//  Pryaniky
//
//  Created by Максим Локтев on 31.01.2021.
//

struct PryanikyResult {
    let data: [DataList]
    let view: [View]
}

enum View: String {
    case hz
    case picture
    case selector
    case unowned
}

struct DataList {
    let name: View
    let data: DataListDetail
}

struct DataListDetail {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant {
    let id: Int
    let text: String
}
