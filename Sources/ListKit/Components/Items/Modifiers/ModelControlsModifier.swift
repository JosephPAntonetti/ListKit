//
//  ModelControlsModifier.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI

public struct ModelControlsModifier<Editor: View>
: ViewModifier {
    
    let editor : (() -> Editor)?
    let onDelete: (() -> Void)?
    
    @State private var isPresented = false
    
    public init(
        editor: (() -> Editor)? = nil,
        onDelete: (() -> Void)? = nil) {
        self.editor = editor
        self.onDelete = onDelete
    }
    
    
    public func body(content: Content) -> some View {
        content
            .contextMenu {
                if editor != nil {
                    Button("Edit", systemImage: "pencil") {
                        isPresented = true
                    }
                }
                if let onDelete = onDelete {
                    Button("Delete", systemImage: "trash") {
                        onDelete()
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                if let editor = editor {
                    editor()
                }
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
