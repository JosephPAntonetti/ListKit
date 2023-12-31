//
//  ModelControlsModifier.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

public struct ModelControlsModifier<Editor: View>
: ViewModifier {
    
    let editor : (() -> Editor)?
    let onDelete: (() -> Void)?
    
    private var model : (any PersistentModel)?
    
    @State private var editorIsPresented = false
    @State private var deleteConfirmationIsPresented = false
    
    @Environment(\.modelContext) private var modelContext
    
    public init(
        editor: (() -> Editor)? = nil,
        onDelete: (() -> Void)? = nil) {
            self.editor = editor
            self.onDelete = onDelete
        }
    
    public init(editor: (() -> Editor)? = nil, model: any PersistentModel) {
        self.editor = editor
        self.model = model
        self.onDelete = nil
    }
    
    public func body(content: Content) -> some View {
        content
            .contextMenu {
                if editor != nil {
                    Button("Edit", systemImage: "pencil") {
                        editorIsPresented = true
                    }
                }
                if onDelete != nil || model != nil {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        deleteConfirmationIsPresented = true
                    }
                }
            }
            .sheet(isPresented: $editorIsPresented) {
                if let editor = editor {
                    editor()
                }
            }
            .alert("Confirm Delete", isPresented: $deleteConfirmationIsPresented, actions: {
                Button("Confirm", role: .destructive) {
                    if let model = model {
                        do {
                            modelContext.delete(model)
                            try modelContext.save()
                        } catch {
                            fatalError("Failed to delete model")
                        }
                    }
                    if let onDelete = onDelete {
                        onDelete()
                    }
                }
            }) {
                Text("Are you sure you want to delete?")
            }
    }
}

public extension View {
    
    func modelControls<Editor: View>(editor: (() -> Editor)? = nil, onDelete: (() -> Void)? = nil) -> some View {
        self.modifier(ModelControlsModifier(editor: editor, onDelete: onDelete))
    }
}

#Preview {
    List {
        Text("Item")
            .modelControls {
                Text("Editor")
            } onDelete: {
                
            }
    }
}
