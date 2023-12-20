//
//  SortMode.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

public struct SortMode<Model : PersistentModel> : Identifiable, Hashable {
    
    public var id : Int {
        descriptor.hashValue
    }
    
    let systemImage : String
    public let label : String
    public let descriptor : SortDescriptor<Model>
    
    public init(systemImage: String, label: String, descriptor: SortDescriptor<Model>) {
        self.systemImage = systemImage
        self.label = label
        self.descriptor = descriptor
    }
}
