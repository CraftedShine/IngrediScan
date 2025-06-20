//
//  CookingTimer.swift
//  IngrediScan
//
//  Created by Faramir on 19.06.25.
//

import SwiftUI
import Combine

struct CookingTimer: View {
    @ObservedObject var cookingService = CookingService.shared
    @Binding var duration: TimeInterval
    @Binding var timeRemaining: TimeInterval
    @State var startTime: Date? = nil
    @State var isRunning = false
    @State private var timer: AnyCancellable? = nil
    
    init(duration: Binding<Int>, timeRemaining: Binding<Int>) {
        self._duration = .constant(TimeInterval(duration.wrappedValue * 60))
        self._timeRemaining = .constant(TimeInterval(timeRemaining.wrappedValue * 60))
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 40) {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 10)
                    
                    Circle()
                        .trim(from: 0, to: currentProgress)
                        .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 0.016), value: currentProgress)
                    
                    VStack {
                        Text(formatTime($timeRemaining.wrappedValue))
                            .font(.title)
                            .bold()
                        
                        if let end = endTime {
                            Text(end.formatted(date: .omitted, time: .shortened))
                                .font(.subheadline .bold())
                        }
                    }
                }
                .frame(width: 200, height: 200)
                
                //MARK: Action Buttons
                HStack(spacing: 20) {
                    CircularButton(color: isRunning ? .red : .green, image: isRunning ? "pause.fill" : "play.fill") {
                        isRunning.toggle()
                        isRunning ? startTimer() : pauseTimer()
                    }
                    CircularButton(color: .red, image: "arrow.trianglehead.clockwise") {
                        resetTimer()
                    }
                }
            }
        }
    }
    
    var currentProgress: Double {
        min($timeRemaining.wrappedValue / duration, 1.0)
    }
    
    var endTime: Date? {
        if isRunning, let start = startTime {
            return start.addingTimeInterval($timeRemaining.wrappedValue)
        }
        return nil
    }
    
    func startTimer() {
        startTime = Date()
        
        timer = Timer.publish(every: 0.02, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.$timeRemaining.wrappedValue > 0.02 {
                    withAnimation(.linear(duration: 0.02)) {
                        self.$timeRemaining.wrappedValue -= 0.02
                    }
                } else {
                    self.pauseTimer()
                    self.$timeRemaining.wrappedValue = 0
                }
            }
    }
    
    func pauseTimer() {
        timer?.cancel()
        isRunning = false
    }
    
    func resetTimer() {
        pauseTimer()
        withAnimation {
            $timeRemaining.wrappedValue = duration
        }
        isRunning = false
    }
    
    private func formatTime(_ seconds: Double) -> String {
        let totalSeconds = Int(seconds)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60
        
        if hours > 0 {
            // z. B. 1:05:03
            return String(format: "%d:%02d:%02d", hours, minutes, secs)
        } else {
            // z. B. 04:59
            return String(format: "%02d:%02d", minutes, secs)
        }
    }
}

#Preview {
    CookingTimer(duration: .constant(10), timeRemaining: .constant(10))
}
