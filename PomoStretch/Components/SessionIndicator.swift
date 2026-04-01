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
                    .foregroundColor(index <= currentSession ? .purple : Color.gray.opacity(0.3))
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
