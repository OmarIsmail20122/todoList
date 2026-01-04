//
//  NotifiationManager.swift
//  todoList
//
//  Created by MacBookPro on 04/01/2026.
//

import Foundation
import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestPeemission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert , .sound , .badge]) { granted , _ in
                print(granted ? "✅ Premission granted" : "❌ Premission denied")
        }
    }
    
    func schedule(todo : ItemListModel) {
        let content = UNMutableNotificationContent()
        content.title = "⏰ Reminder"
        content.body = "Don't forget \(todo.title)"
        content.sound = .default
        
        let notifyDate = todo.dateTime.addingTimeInterval(-300)
        
        let components = Calendar.current.dateComponents([.year , .month , .day , .hour , .minute], from: notifyDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: todo.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
