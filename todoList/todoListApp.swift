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
  @StateObject  var listViewModel : ListViewModel = ListViewModel()    
    init() {
        NotificationManager.shared.requestPeemission()
    }
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
