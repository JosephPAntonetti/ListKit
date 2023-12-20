//
//  ExampleModel.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

@Model final class ExampleModel : Sortable {
    
    var text : String
    var value : Int
    
    static var DefaultSortMode: SortMode<ExampleModel> {
        SortMode(systemImage: "plus", label: "By Text", descriptor: .init(\ExampleModel.text))
    }
    
    static var SortModels: [SortMode<ExampleModel>] {
        [
            SortMode(systemImage: "plus", label: "By Text", descriptor: .init(\ExampleModel.text)),
            SortMode(systemImage: "square", label: "By Value", descriptor: .init(\ExampleModel.value))
        ]
    }
    
    init(text: String, value: Int) {
        self.text = text
        self.value = value
    }
    
    static func exampleData() -> [ExampleModel] {
        (0...10).map({i in ExampleModel(text: "\(i)", value: .random(in: 0...100))})
    }
}
