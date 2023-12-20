//
//  DynamicListExample.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

struct DynamicListExample: View {
    
    @State var sort : SortDescriptor = .init(\ExampleModel.text)
    
    var body: some View {
        NavigationView {
            List {
                DynamicList(sort: [sort], animation: .easeInOut) {
                    model in Text("\(model.text):\(model.value)")
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("By Text") {
                        withAnimation {
                            sort = .init(\ExampleModel.text)
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("By Value") {
                        withAnimation {
                            sort = .init(\ExampleModel.value)
                        }
                    }
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
