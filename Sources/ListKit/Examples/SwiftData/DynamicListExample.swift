//
//  DynamicListExample.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

struct DynamicListExample: View {
    
    @State var sortMode = ExampleModel.DefaultSortMode
    
    var body: some View {
        NavigationView {
            List {
                DynamicList(sort: sortMode, animation: .easeInOut) {
                    model in Text("\(model.text):\(model.value)")
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    SortModeSelector(sortMode: $sortMode)
                }
            }
        }
    }
}

#Preview {
    do {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: ExampleModel.self, configurations: configuration)
        for model in ExampleModel.exampleData() {
            modelContainer.mainContext.insert(model)
        }
        return DynamicListExample()
            .modelContainer(modelContainer)
    } catch {
        fatalError("Failed to start preview")
    }
}
