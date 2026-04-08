//
//  SettingsView.swift
//  PomoStretch
//
//  Created by Academy on 07/04/26.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: TimerViewModel
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true
    
    @ViewBuilder
    func SettingsCard<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        VStack(spacing: 16) {
            content()
        }
        .padding()
        .background(Color("SurfaceDark"))
        .cornerRadius(16)
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 32) {
                    
                    VStack(spacing: 8) {
                        Text("Configure seu Pomodoro")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Personalize seus tempos e ciclos")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 40)
                    .multilineTextAlignment(.center)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("TEMPOS DO POMODORO (MINUTOS)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                        
                        SettingsCard {
                            Stepper(value: $viewModel.focusDuration, in: 10...60, step: 5) {
                                HStack {
                                    Text("Tempo de Foco").foregroundColor(.white)
                                    Spacer()
                                    Text("\(viewModel.focusDuration) min").foregroundColor(.white).opacity(0.7)
                                }
                            }
                            Divider().background(Color.white.opacity(0.2))
                            Stepper(value: $viewModel.shortPauseDuration, in: 1...15, step: 1) {
                                HStack {
                                    Text("Pausa Curta").foregroundColor(.white)
                                    Spacer()
                                    Text("\(viewModel.shortPauseDuration) min").foregroundColor(.white).opacity(0.7)
                                }
                            }
                            Divider().background(Color.white.opacity(0.2))
                            Stepper(value: $viewModel.longPauseDuration, in: 10...45, step: 5) {
                                HStack {
                                    Text("Pausa Longa").foregroundColor(.white)
                                    Spacer()
                                    Text("\(viewModel.longPauseDuration) min").foregroundColor(.white).opacity(0.7)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("CICLOS")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                        
                        SettingsCard {
                            Stepper(value: $viewModel.targetSessions, in: 1...8, step: 1) {
                                HStack {
                                    Text("Ciclos até pausa longa").foregroundColor(.white)
                                    Spacer()
                                    Text("\(viewModel.targetSessions)").foregroundColor(.white).opacity(0.7)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("AVISOS")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                        
                        SettingsCard {
                            Toggle(isOn: $notificationsEnabled) {
                                Text("Ativar Notificações").foregroundColor(.white)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: Color("PurpleNeon")))
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}
