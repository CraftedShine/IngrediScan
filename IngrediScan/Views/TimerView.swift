//
//  TimerView.swift
//  IngrediScan
//
//  Created by Faramir on 21.06.25.
//

import SwiftUI

struct InlineTimerView: View {
    @EnvironmentObject private var viewModel: TimerViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(formatTime(viewModel.remainingTime))
                    .font(.largeTitle)
                    .bold()
                
                if let endDate = viewModel.endDate {
                    Text("Fertig: \(endDate.formatted(date: .omitted, time: .shortened))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 5)
                
                Circle()
                    .trim(from: 0.0, to: viewModel.progress)
                    .stroke(isRunning ? Color.orange : Color.green, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: viewModel.progress)
                
                //MARK: Play/Pause Button
                
                CircularButton(size: 20, padding: 15, color: .clear, contentColor: isRunning ? .orange : .green, image: isRunning ? "pause.fill" : "play.fill") {
                    if !isRunning {
                        viewModel.start()
                    } else {
                        viewModel.pause()
                    }
                }
            }
            .frame(width: 20, height: 20)
            
            Spacer()
            
            HStack {
                RoundedRectangularButton(title: "Neustarten", color: .white, backgroundColor: .orange) {
                    viewModel.reset()
                }
                .frame(maxWidth: 150)
            }
            
        }
        .padding()
        .background(Color(uiColor: UIColor.secondarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(width: .infinity)
    }
    
    var isRunning: Bool {
        viewModel.isRunning
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
    InlineTimerView()
    .withPreviewEnvironmentObjects()
}
