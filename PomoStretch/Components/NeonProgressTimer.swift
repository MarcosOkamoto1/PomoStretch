//
//  NeonProgressTimer.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//

import SwiftUI
import Foundation

struct NeonProgressTimer: View {
    var progress: CGFloat
    var timeString: String
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(Color.white.opacity(0.05))
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    LinearGradient(
                        colors: [Color("PurpleNeon"), Color("PurplePrimary")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(Angle(degrees: -90))
                .shadow(color: Color("PurpleNeon").opacity(0.6), radius: 15)
                .animation(.linear(duration: 1.0), value: progress)

            Text(timeString)
                .font(.system(size: 80, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(40)
    }
}

struct NeonProgressTimer_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            NeonProgressTimer(progress: 0.75, timeString: "18:45")
    }
        .preferredColorScheme(.dark)
    }
}
