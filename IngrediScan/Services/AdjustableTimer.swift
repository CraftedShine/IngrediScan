//
//  AdjustableTimer.swift
//  IngrediScan
//
//  Created by Faramir on 21.06.25.
//

import Foundation

class AdjustableTimer {
    private var timer: Timer?
    private var totalDuration: TimeInterval
    private var remainingTime: TimeInterval
    private var lastStartTime: Date?
    private var tickHandler: ((TimeInterval) -> Void)?
    private var completionHandler: (() -> Void)?
    
    var isRunning: Bool {
        return timer != nil
    }
    
    init(duration: TimeInterval,
         onTick: ((TimeInterval) -> Void)? = nil,
         onComplete: (() -> Void)? = nil) {
        self.totalDuration = duration
        self.remainingTime = duration
        self.tickHandler = onTick
        self.completionHandler = onComplete
    }
    
    func start() {
        guard timer == nil else { return }
        lastStartTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.tick()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func pause() {
        guard let start = lastStartTime else { return }
        remainingTime -= Date().timeIntervalSince(start)
        stopTimer()
    }
    
    func resume() {
        start()
    }
    
    func reset(to newDuration: TimeInterval? = nil) {
        stopTimer()
        if let newDuration = newDuration {
            totalDuration = newDuration
            remainingTime = newDuration
        } else {
            remainingTime = totalDuration
        }
    }
    
    // Setze verbleibende Zeit direkt auf einen bestimmten Wert
    func setRemainingTime(to newTime: TimeInterval) {
        stopTimer()
        remainingTime = newTime
        start()
    }
    
    private func tick() {
        guard let start = lastStartTime else { return }
        let elapsed = Date().timeIntervalSince(start)
        let currentRemaining = remainingTime - elapsed
        
        if currentRemaining <= 0 {
            stopTimer()
            tickHandler?(0)
            completionHandler?()
        } else {
            tickHandler?(currentRemaining)
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        lastStartTime = nil
    }
}
