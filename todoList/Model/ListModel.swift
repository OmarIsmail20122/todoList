//
//  ListModel.swift
//  todoList
//
//  Created by Mac on 14/07/2024.
//

import Foundation

struct ItemListModel : Identifiable , Codable {
    let id : String
    let title : String
    let isCompleted : Bool
    let dateTime : Date
    
    init(id : String = UUID().uuidString ,title: String, isCompleted: Bool, dateTime : Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dateTime = dateTime
    }
    
    
    func updateCompleted() -> ItemListModel {
        return ItemListModel(id: id , title: title, isCompleted: !isCompleted,dateTime: dateTime)
    }
}
