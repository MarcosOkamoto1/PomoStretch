//
//  SettingsView.swift
//  PomoStretch
//
//  Created by Academy on 30/03/26.
//

import SwiftUI

struct StretchView: View {
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            
            VStack(spacing: 0) {
                VStack(spacing: 8) {
                    Text("Alongamentos")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Previna lesões por esforço repetitivo")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                ScrollView(showsIndicators: false) {
               
                    VStack(spacing: 24) {
                        
                        VStack(spacing: 12) {
                            CapsuleIndicator(text: "Pausa Curta (5 min)", iconName: "cup.and.saucer.fill")
                                .padding(.bottom, 4)
                            
                            ForEach(ExerciseData.shortBreakExercises) { exercise in
                                ExerciseCard(exercise: exercise)
                            }
                        }
                        
                        VStack(spacing: 12) {
                            CapsuleIndicator(text: "Pausa Longa (15 min)", iconName: "figure.walk")
                                .padding(.bottom, 4)
                            
                            ForEach(ExerciseData.longBreakExercises) { exercise in
                                ExerciseCard(exercise: exercise)
                            }
                        }
                        
                    }
                    .padding(.top, 4)
                    .padding(.bottom, 120)
                }
            }
        }
    }
}

struct ExerciseCard: View {
    let exercise: Exercise
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            Image(exercise.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("PurpleNeon").opacity(0.5), lineWidth: 1)
                )
                .shadow(color: Color("PurpleNeon").opacity(0.3), radius: 6, x: 0, y: 4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(exercise.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "repeat")
                        Text("\(exercise.sets) séries")
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                        Text(exercise.repsOrDuration)
                    }
                }
                .font(.caption)
                .foregroundColor(Color("PurpleNeon"))
        
                Text(exercise.description)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 2)
            }
            Spacer()
        }
        .padding()
        .background(Color("SurfaceDark"))
        .cornerRadius(20)
        .padding(.horizontal, 24)
    }
}

struct StretchView_Previews: PreviewProvider {
    static var previews: some View {
        StretchView()
    }
}
