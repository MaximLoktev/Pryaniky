//
//  DataListMapper.swift
//  Pryaniky
//
//  Created by Максим Локтев on 01.02.2021.
//

protocol DataListMapper {
    func map(result: API.Pryaniky.ResultsDataList) -> PryanikyResult
}

final class DataListMapperImpl: DataListMapper {
    
    func map(result: API.Pryaniky.ResultsDataList) -> PryanikyResult {
        PryanikyResult(data: result.data.map(mapDataList),
                       view: result.view.map(mapView))
    }
    
    private func mapDataList(data: API.Pryaniky.DataList) -> DataList {
        DataList(name: mapView(view: data.name),
                 data: mapDataListDetail(data.data))
    }
    
    private func mapDataListDetail(_ data: API.Pryaniky.DataListDetail) -> DataListDetail {
        DataListDetail(text: data.text,
                       url: data.url,
                       selectedId: data.selectedId,
                       variants: data.variants?.compactMap(mapVariants))
    }
    
    private func mapVariants(data: API.Pryaniky.Variant) -> Variant {
        Variant(id: data.id, text: data.text)
    }
    
    private func mapView(view: String) -> View {
        View(rawValue: view) ?? .unowned
    }
}
