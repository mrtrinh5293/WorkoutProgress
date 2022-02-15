//
//  Extension.swift
//  WorkoutProgress
//
//  Created by duc on 2022-02-10.
//

import Foundation

extension Int16 {
    
    func displayDuration() -> String {
        let duration = self
        return "\(String(format: "%02d", duration / kOneHour)):\(String(format: "%02d", (duration % kOneHour) / kOneMinute)):\(String(format: "%02d", (duration % kOneHour) % kOneMinute))"
    }
    
    func detailedDisplayDuration(shouldIncludeSeconds: Bool = true) -> String {
        let duration = self
        let hours = duration / kOneHour
        let minutes = (duration % kOneHour) / kOneMinute
        let seconds = (duration % kOneHour) % kOneMinute
        var hourString = ""
        var minuteString = ""
        var secondsString = ""
        
        if hours > 0 {
            hourString.append("\(hours)h")
        }
        if minutes > 0 {
            minuteString.append("\(minutes)m")
        }
        if seconds > 0 {
            secondsString.append("\(seconds)s")
        }
        let sample: [String] = [hourString, minuteString, secondsString]
        return sample.joined(separator: " ").trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
