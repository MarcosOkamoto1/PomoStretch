//
//  TimerView.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//


import SwiftUI
import Foundation

struct SessionIndicator: View {
    var currentSession: Int
    var totalSessions: Int
    var body: some View {
        HStack(spacing: 12) {
            ForEach(1...totalSessions, id: \.self) { index in
                Circle()
                    .frame(width: 12, height: 12)
                    .foregroundColor(index <= currentSession ? Color("PurpleNeon") : Color.white.opacity(0.2))
            }
        }
    }
}

struct SessionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            SessionIndicator(currentSession: 2, totalSessions: 3)
        }
    }
}
