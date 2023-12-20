//
//  SortModeSelector.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI

public struct SortModeSelector<Model : Sortable>: View {
    
    @Binding public var sortMode : SortMode<Model>
    
    public init(sortMode: Binding<SortMode<Model>>) {
        self._sortMode = sortMode
    }
    
    public var body: some View {
        Picker("Sort Mode", selection: $sortMode.animation()) {
            ForEach(Model.SortModels) {
                mode in
                Text(mode.label)
                    .tag(mode)
            }
        }
    }
}
