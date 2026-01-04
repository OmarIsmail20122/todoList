//
//  HeadListRow.swift
//  todoList
//
//  Created by Mac on 14/07/2024.
//

import SwiftUI

struct HeadListRow: View {
    let item : ItemListModel
   
    var body: some View {
        VStack(
            alignment: .leading,
            content: {
            HStack(content: {
                Image(systemName:item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.title)
                    .font(.title)
            })
                Text(item.dateTime.formatted(
                    Date.FormatStyle()
                        .locale(Locale(identifier: "en_US"))
                ))
        })
    }
}

struct HeadListRow_Previews: PreviewProvider {
    static var item1 = ItemListModel(title: "This is first Title!", isCompleted: true,dateTime: Date.now)
    static var item2 = ItemListModel(title: "This is Second Title!", isCompleted: false,dateTime: Date.now)
    
    static var previews: some View {
        Group(content: {
            HeadListRow(item: item1)
            HeadListRow(item: item2)
        })
        .previewLayout(.sizeThatFits)
    }
}
