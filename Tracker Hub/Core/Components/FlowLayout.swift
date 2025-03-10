//
//  FlowLayout.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.03.2025.
//

import SwiftUI

struct FlowLayout<Content: View>: View {
    let items: [String]
    let spacing: CGFloat
    let content: (String) -> Content

    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        var width: CGFloat = 0
        var height: CGFloat = 0

        return GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(items, id: \.self) { item in
                    content(item)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > geometry.size.width) {
                                width = 0
                                height -= dimension.height + spacing
                            }
                            let result = width
                            if item == items.last! {
                                width = 0
                            } else {
                                width -= dimension.width + spacing
                            }
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = height
                            if item == items.last! {
                                height = 0
                            }
                            return result
                        }
                }
            }
            .frame(height: -height)
        }
    }
}
