//
//  ModeButton.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//
import Foundation
import SwiftUI

struct ModeButton: View {
    var title : String
    var action: () -> Void
    var iconName: String
    var body: some View {
        Button(action: {
            action(
                
            )
        }) {
            VStack(spacing: 8) {
                Image(systemName: iconName)
                Text(title)
            }
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.purple)
            .frame(width: 130, height: 60)
            .overlay(Capsule().stroke(Color.purple, lineWidth: 1.5))
        }
    }
}

struct ModeButton_Previews: PreviewProvider {
    static var previews: some View {
        ModeButton(title: "Long Pause", action: {}, iconName: "cup.and.saucer")
    }
}
