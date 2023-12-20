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
        Menu {
            Picker("Sort", systemImage: "line.3.horizontal.decrease.circle.fill", selection: $sortMode.animation()) {
                ForEach(Model.SortModels) {
                    mode in
                    Label(mode.label, systemImage: mode.systemImage)
                        .tag(mode)
                }
            }
        } label: {
            Image(systemName: sortMode.systemImage)
                .font(.system(.body, design: .rounded, weight: .semibold))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.primary)
                .padding(.all, 4)
                .background {
                    Circle()
                        .foregroundStyle(.primary.quinary)
                }
        }
        .contentTransition(.symbolEffect(.replace.downUp))
    }
}
