//
//  SessionTagIndicator.swift
//  PomoStretch
//
//  Created by Academy on 08/04/26.
//

import SwiftUI
import Foundation

struct SessionTagIndicator: View {
    var sessionNumber: Int
    var targetSessions: Int
    var actualSession: TimerViewModel.currentSession
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: actualSession == .focus ? "flame.fill" : "drop.fill")
                .foregroundColor(actualSession == .focus ? Color("PurpleNeon") : .cyan)
            
            Text(actualSession == .focus ? "Série \(sessionNumber)/\(targetSessions)" : "Recuperação")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.1))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(actualSession == .focus ? Color("PurpleNeon").opacity(0.5) : Color.cyan.opacity(0.5), lineWidth: 1)
        )
    }
}

struct SessionTagIndicator_Previews: PreviewProvider {
    static var previews: some View {
        // Você precisa passar valores fictícios para o preview funcionar
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            SessionTagIndicator(
                sessionNumber: 1,
                targetSessions: 4,
                actualSession: .focus
            )
        }
    }
}
