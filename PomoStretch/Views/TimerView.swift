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
            Color.black.ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                VStack(spacing: 12) {
                    Text("Pomodoro Timer")
                        .font(.system(size: 32, weight: .bold))
                    SessionIndicator(currentSession: 1, totalSessions: 3)
                }
                
                Spacer()
                
                NeonProgressTimer(progress: viewModel.progress, timeString: viewModel.timeString())
                    .frame(width: 400, height: 400, alignment: .center)
                
                Spacer()
                HStack(spacing: 24) {
                    ModeButton(title: "Short Pause", action: {viewModel.setShortPause()}, iconName: "cup.and.saucer.fill")
                    ModeButton(title: "Long Pause", action: {viewModel.setLongPause()}, iconName: "figure.walk")
                }
                .padding(.bottom, 32)
                
                PrimaryButton(title: viewModel.isRunning ? "Pause": "Start",
                              action: {
                    if viewModel.isRunning {
                        viewModel.pauseTimer()
                    } else {
                        viewModel.startTimer()
                    }
                }
                )
                    .padding()
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

