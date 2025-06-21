//
//  NotificationService.swift
//  IngrediScan
//
//  Created by Faramir on 21.06.25.
//

import Foundation
import UserNotifications

class NotificationService {
    static let shared = NotificationService()

    private init() {}

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Benachrichtigungs-Berechtigung fehlgeschlagen: \(error.localizedDescription)")
            }
        }
    }

    func scheduleNotification(for endDate: Date, title: String = "Timer ist fertig!", body: String = "Es ist Zeit weiter zu kochen.") {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let timeInterval = endDate.timeIntervalSinceNow
        guard timeInterval > 0 else {
            print("Zeitpunkt liegt in der Vergangenheit.")
            return
        }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "timer_done", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }

    func cancelNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["timer_done"])
    }
}
