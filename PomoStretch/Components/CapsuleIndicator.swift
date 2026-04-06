//
//  CapsuleIndicator.swift
//  PomoStretch
//
//  Created by Academy on 02/04/26.
//

import SwiftUI
import Foundation

struct CapsuleIndicator: View {
    let text: String
    let iconName: String
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: iconName)
                .font(.caption)
            Text(text)
                .font(.caption)
                .fontWeight(.semibold)
        }
        .foregroundColor(.white)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color("PurpleSurface")) // Cor do Assets
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color("PurpleNeon").opacity(0.5), lineWidth: 1))
    }
}

struct CapsuleIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                CapsuleIndicator(text: "Short Pause (5 min)", iconName: "cup.and.saucer.fill")
        
                CapsuleIndicator(text: "Long Pause (20 min)", iconName: "moon.stars.fill")
            }
        }
    }
}
