//
//  Sortable.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

public protocol Sortable : PersistentModel {
    
    static var DefaultSortMode : SortMode<Self> { get }
    
    static var SortModels : [SortMode<Self>] { get }
}
