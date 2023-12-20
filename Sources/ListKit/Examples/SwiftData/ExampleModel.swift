//
//  ExampleModel.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

@Model final class ExampleModel {
    
    var text : String
    var value : Int
    
    init(text: String, value: Int) {
        self.text = text
        self.value = value
    }
    
    static func exampleData() -> [ExampleModel] {
        (0...10).map({i in ExampleModel(text: "\(i)", value: .random(in: 0...100))})
    }
}
