//
//  TimerView.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//

import Foundation
import SwiftUI

struct TimerView: View {
    @StateObject var viewModel = TimerViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 12) {
                    Text("Pomodoro Timer")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top)
                    
                    SessionIndicator(currentSession: viewModel.sessionNumber, totalSessions: viewModel.totalSessions)
                }
                
                Spacer()
                
                NeonProgressTimer(progress: viewModel.progress, timeString: viewModel.timeString())
                    .frame(width: 390, height: 400, alignment: .center)
                
                Spacer()
                
                HStack(spacing: 24) {
                    ModeButton(title: "Short Pause", action: {viewModel.setShortPause()}, iconName: "cup.and.saucer.fill")
                    ModeButton(title: "Long Pause", action: {viewModel.setLongPause()}, iconName: "figure.walk")
                }
                .padding(.bottom, 16)
            
                HStack(spacing: 20) {
                    if viewModel.timeRemaining < viewModel.totalTime {
                        ResetButton(iconName: "arrow.counterclockwise") {
                            viewModel.resetTimer()
                        }
                    }
                    
                    PrimaryButton(title: viewModel.isRunning ? "Pause": "Start", action: {
                        if viewModel.isRunning {
                            viewModel.pauseTimer()
                        } else {
                            viewModel.startTimer()
                        }
                    })
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
