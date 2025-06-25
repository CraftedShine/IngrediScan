//
//  TimerViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.06.25.
//

import Foundation
import Combine

@MainActor
class TimerViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 0
    @Published var isRunning = false
    @Published var totalDuration: TimeInterval = 1
    
    private var timer: AdjustableTimer?
    
    init(initialDuration: TimeInterval = 10) {
        totalDuration = initialDuration
        remainingTime = initialDuration
        
        self.timer = AdjustableTimer(duration: initialDuration, onTick: { [weak self] timeLeft in
            DispatchQueue.main.async {
                self?.remainingTime = timeLeft
            }
        }, onComplete: { [weak self] in
            DispatchQueue.main.async {
                self?.isRunning = false
                VibrationService.shared.vibrateForSeconds(5)
            }
        })
    }
    
    func start() {
        timer?.start()
        isRunning = true
        
        if let date = self.endDate {
            // Notification when Timer is over
            NotificationService.shared.requestPermission()
            NotificationService.shared.scheduleNotification(for: date)
        }
    }
    
    func pause() {
        timer?.pause()
        isRunning = false
        
        NotificationService.shared.cancelNotification()
    }
    
    func resume() {
        timer?.resume()
        isRunning = true
        
        if let date = self.endDate {
            // Notification when Timer is over
            NotificationService.shared.scheduleNotification(for: date)
        }
    }
    
    func reset(to newTime: TimeInterval? = nil) {
        timer?.pause() // Stop First
        if let newTime = newTime {
            totalDuration = newTime
            remainingTime = newTime
            timer?.reset(to: newTime)
        } else {
            remainingTime = totalDuration
            timer?.reset(to: totalDuration)
        }
        isRunning = false
    }
    
    func setTime(to newTime: TimeInterval) {
        timer?.setRemainingTime(to: newTime)
        totalDuration = newTime
        remainingTime = newTime
        pause()
    }
    
    var endDate: Date? {
        isRunning ? Date().addingTimeInterval(remainingTime) : nil
    }
    
    var progress: Double {
        guard totalDuration > 0 else { return 0 }
        return remainingTime / totalDuration // Countdown
    }
}
