//
//  CookingView.swift
//  IngrediScan
//
//  Created by Faramir on 16.06.25.
//

import SwiftUI
import Combine

struct CookingView: View {
    @Binding var recipe: Recipe
    @Binding var recipeSteps: [StepRelation]
    
    @State var currentStepIndex: Int
    @State var currentStep: RecipeStep
    @State private var duration: TimeInterval // Gesamtzeit in Sekunden
    @State private var timeRemaining: TimeInterval
    @State private var startTime: Date?
    @State private var isFinished = false
    @State private var isRunning = false
    @State private var timer: AnyCancellable?
    
    
    init(recipe: Binding<Recipe>) {
        self._recipe = recipe
        self._currentStepIndex = State(initialValue: 0)
        self._currentStep = State(initialValue: recipe.wrappedValue.hasSteps.first!.RecipeStep)
        self._recipeSteps = recipe.hasSteps
        
        let timerDuration = TimeInterval(recipe.wrappedValue.hasSteps.first!.RecipeStep.duration * 60)
        
        self._duration = State(initialValue: timerDuration)
        self._timeRemaining = State(initialValue: timerDuration)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Zubereitung")
                .font(.subheadline.smallCaps().bold())
                .foregroundColor(.secondary)
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
                        Text(formatTime(timeRemaining))
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
                
                StepTimeline(steps: $recipeSteps)
            }
        }
        .padding()
    }
    
    var currentProgress: Double {
        min(timeRemaining / duration, 1.0)
    }
    
    var endTime: Date? {
        if isRunning, let start = startTime {
            return start.addingTimeInterval(timeRemaining)
        }
        return nil
    }
    
    func startTimer() {
        startTime = Date()
        
        timer = Timer.publish(every: 0.02, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if timeRemaining > 0.02 {
                    withAnimation(.linear(duration: 0.02)) {
                        timeRemaining -= 0.02
                    }
                } else {
                    pauseTimer()
                    timeRemaining = 0
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
            timeRemaining = duration
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
    CookingView(recipe: .constant(Recipe.caesarSalad))
}
