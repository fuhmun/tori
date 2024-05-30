//
//  TagListView.swift
//  tori
//
//  Created by Alexander Washington on 5/29/24.
//

import SwiftUI
import SwiftData

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var size: CGFloat = 0
    var price: String?
    var categories: [String]?
}

struct TagListView: View {
    
    var maxLimit: Int = 150
    var fontSize: CGFloat = 16
    
    @State private var tags: [Tag]
    var geoProx: GeometryProxy
    
    init(tags: [Tag], geoProx: GeometryProxy) {
        _tags = State(initialValue: tags)
        self.geoProx = geoProx
        self.updateTagSizes()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            //            ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(getRows(geoProx),id: \.self) { rows in
                    HStack(spacing:5) {
                        ForEach(rows) { row in
                            RowView(tag: row)
                        }
                    }
                }
            }
            .frame(width: geoProx.size.width/1, alignment: .leading)
            .padding(.vertical)
            //            }
            //            .frame(maxWidth: .infinity)
        }
        .onChange(of: tags) {
            updateTagSizes()
        }
        .onAppear {
            updateTagSizes()
        }
    }
    
    private func updateTagSizes() {
        for i in tags.indices {
            let font = UIFont.systemFont(ofSize: fontSize)
            let attributes = [NSAttributedString.Key.font: font]
            let size = (tags[i].name as NSString).size(withAttributes: attributes)
            tags[i].size = size.width
        }
    }
    
    @ViewBuilder
    func RowView(tag: Tag)->some View{
        HStack {
            Text(tag.name)
                .font(.caption)
                .foregroundStyle(.accent)
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                )
                .lineLimit(1)
            
            if let price = tag.price {
                Text(price)
                    .font(.caption)
                    .foregroundStyle(.accent)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                    )
                    .lineLimit(1)
            }
        }
        .padding(.leading, 10)
    }
    
    func getIndex(tag: Tag)->Int {
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        return index
    }
    
    func getRows(_ boxWidth: GeometryProxy)->[[Tag]]{
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        var totalWidth: CGFloat = 0
        let screenWidth: CGFloat = boxWidth.size.width
        tags.forEach { tag in
            totalWidth += (tag.size + 50)
            if totalWidth > screenWidth {
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 50) : 0)
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
                
            } else {
                currentRow.append(tag)
            }
        }
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
    }
    
}

//#Preview {
//    TagListView()
//}
