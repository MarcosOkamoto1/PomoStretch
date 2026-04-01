//
//  TimerView.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//

import SwiftUI
import Foundation

struct ResetButton: View {
    var iconName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: iconName)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.purple)
                .frame(width: 50, height: 50)
                .overlay(Circle().stroke(Color.purple, lineWidth: 1.5))
                 .shadow(color: .purple.opacity(0.6), radius: 5)
        }
    }
}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ResetButton(iconName: "arrow.counterclockwise", action: {})
        }
    }
}
