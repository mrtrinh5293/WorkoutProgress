//
//  NotificationHelper.swift
//  WorkoutProgress
//
//  Created by duc on 2022-01-14.
//

import Foundation


private let kLocalNotificationIdentifier = "kLocalNotificationIdentifier"
private let kLocalTimerNotificationIdentifier = "kLocalTimerNotificationIdentifier"

enum LocalNotificationType {
    case date(Date)
    case interval(TimeInterval)
}

class NotificationHelper: NSObject {
    
    static private func configuareLocalNotification(at hour: Int?, minute: Int?) {
//        invalidateLocalNotification(with: [kLo])
    }
}
