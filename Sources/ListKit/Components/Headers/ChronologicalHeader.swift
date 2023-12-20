//
//  ChronologicalHeader.swift
//  
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI

/*
 A header styled after the chronological headers in the Apple Reminders app
 */
public struct ChronologicalHeader: View {
    
    let title : String?
    let subtitle : String?
    
    public init(title: String? = nil, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if let title = title {
                    Text(title)
                        .font(.system(.title3, design: .rounded))
                        .bold()
                }
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
        .background(.background)
    }
}

#Preview {
    ScrollView {
        LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders, .sectionFooters]) {
            Section {
                Text("Content")
            } header: {
                ChronologicalHeader(title: "Just Large Title")
            } footer: {
                Divider()
            }
            Section {
                Text("Content")
            } header: {
                ChronologicalHeader(subtitle: "Just Subtitle")
            }
            Section {
                Text("Content")
            } header: {
                ChronologicalHeader(title: "Large Title", subtitle: "Subtitle")
            }
        }
    }
}
