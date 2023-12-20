//
//  DynamicList.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

struct DynamicList<Model: PersistentModel, Row: View>: View {
    
    @Query private var items : [Model]
    
    @ViewBuilder let row : (Model) -> Row
    
    init(
        filter: Predicate<Model>? = nil,
        sort: [SortDescriptor<Model>] = [],
        animation: Animation,
        row: @escaping (Model) -> Row) {
            _items = Query(filter: filter, sort: sort, animation: animation)
            self.row = row
        }
    
    var body: some View {
        ForEach(items) {
            row($0)
        }
    }
}
