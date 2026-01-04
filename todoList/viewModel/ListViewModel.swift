//
//  ListViewModel.swift
//  todoList
//
//  Created by Mac on 15/07/2024.
//

import Foundation


class ListViewModel : ObservableObject {
    @Published var items : [ItemListModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey : String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
        let savedItems = try? JSONDecoder().decode([ItemListModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItemFromList(indexSet : IndexSet ){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItemInList(from : IndexSet , to : Int ){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String,dateTime : Date){
        let newItem = ItemListModel(title: title, isCompleted: false,dateTime: dateTime)
        
        items.append(newItem)
        NotificationManager.shared.schedule(todo: newItem)
    }
    
    func updateItem(item : ItemListModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompleted()
        }
    }
    
    func saveItems() {
        if let encodedDate = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedDate, forKey: itemsKey)
        }
    }
}
