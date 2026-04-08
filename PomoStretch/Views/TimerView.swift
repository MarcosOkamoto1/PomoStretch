//
//  ContentView.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 12) {
                    Text(viewModel.actualSession == .focus ? "Foco Total" : "Pausa Ativa")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top)
                    
                    Text("Não esqueça de alongar os punhos nas pausas")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    SessionTagIndicator(
                        sessionNumber: viewModel.sessionNumber,
                        targetSessions: viewModel.targetSessions,
                        actualSession: viewModel.actualSession
                    )
                }
                
                Spacer()
                
                NeonProgressTimer(progress: viewModel.progress, timeString: viewModel.timeString())
                    .frame(width: 380, height: 380, alignment: .center)
                
                
                HStack(spacing: 24) {
                    ModeButton(title: "Pausa Curta", action: {viewModel.setShortPause()}, iconName: "cup.and.saucer.fill")
                    ModeButton(title: "Pausa Longa", action: {viewModel.setLongPause()}, iconName: "figure.walk")
                }
                .padding(.bottom, 16)
            
                HStack(spacing: 20) {
                    if viewModel.timeRemaining < viewModel.totalTime {
                        ResetButton(iconName: "arrow.counterclockwise") {
                            viewModel.resetTimer()
                        }
                    }
                    
                    PrimaryButton(title: viewModel.isRunning ? "Pausar": "Começar", action: {
                        if viewModel.isRunning {
                            viewModel.pauseTimer()
                        } else {
                            viewModel.startTimer()
                        }
                    })
                }
                .padding(.horizontal)
                .padding(.bottom, 30) 
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}
