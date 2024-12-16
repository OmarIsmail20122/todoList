//
//  todoListApp.swift
//  todoList
//
//  Created by Mac on 08/06/2024.
//

import SwiftUI
import CoreData


@main
struct todoListApp: App {
//    let persistenceController = PersistenceController.shared
  @StateObject  var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
