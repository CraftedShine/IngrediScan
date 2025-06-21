//
//  VibrationService.swift
//  IngrediScan
//
//  Created by Faramir on 21.06.25.
//

import AVFoundation
import UIKit

class VibrationService {
    static let shared = VibrationService()

    private var vibrationTimer: Timer?

    func vibrateForSeconds(_ seconds: Double, interval: Double = 0.5) {
        stopVibration() // Make sure Vibration is stopped
        
        var vibrationCount = 0
        vibrationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            vibrationCount += 1
            if vibrationCount >= Int(seconds / interval) {
                timer.invalidate()
            }
        }
    }

    func stopVibration() {
        vibrationTimer?.invalidate()
        vibrationTimer = nil
    }
}
