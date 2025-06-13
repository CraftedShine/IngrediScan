//
//  CookingTimer.swift
//  IngrediScan
//
//  Created by Faramir on 13.06.25.
//

import SwiftUI

struct CookingTimer: View {
    @State var totalTime: Double    // Totaltime in Seconds
    @State private var timeRemaining: Double // Time remaining in Seconds
    @State private var timer: Timer? = nil
    @State private var isRunning = false
    @State private var isFinished = false
    
    init(totalTime: Double) {
        self.totalTime = totalTime
        self.timeRemaining = totalTime
    }
    
    var progress: Double {
        return Double(timeRemaining) / Double(totalTime)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text(isFinished ? "✅ Fertig!" : "⏳ Noch \(timeRemaining) Sekunden")
                .font(.title2)
            
            
            
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                .padding(.horizontal)
                .animation(.smooth(duration: 0.1), value: progress)
            
            HStack(spacing: 20) {
                Button("Start") {
                    startTimer()
                }
                .disabled(isRunning)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Reset") {
                    resetTimer()
                }
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func startTimer() {
        stopTimer()
        timeRemaining = totalTime
        isFinished = false
        isRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if timeRemaining > 0.1 {
                timeRemaining -= 0.1
            } else {
                stopTimer()
                isFinished = true
                isRunning = false
            }
        }
    }
    
    func resetTimer() {
        stopTimer()
        timeRemaining = totalTime
        isFinished = false
        isRunning = false
    }
    
    func stopTimer() {
        timeRemaining = 0
        timer?.invalidate()
        timer = nil
    }
}


#Preview {
    CookingTimer(totalTime: 10)
}
