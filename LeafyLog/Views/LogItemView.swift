//
//  LogItemView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

struct LogItemView: View {
    
    @StateObject var viewModel = LogItemViewVM()
    
    let item: LogItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title).font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
    }
}

#Preview {
    LogItemView(item: .init(id: "123", title: "Get bananas", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
