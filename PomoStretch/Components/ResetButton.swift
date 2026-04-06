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
                .foregroundColor(Color("PurpleNeon")) 
                .frame(width: 50, height: 50)
                .background(Color("SurfaceDark"))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("PurpleNeon"), lineWidth: 1.5))
                .shadow(color: Color("PurpleNeon").opacity(0.4), radius: 5)
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
