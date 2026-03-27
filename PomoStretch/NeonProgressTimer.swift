//
//  NeonProgressTimer.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//

import SwiftUI

struct NeonProgressTimer: View {
    var progress: CGFloat
    var timeString: String
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(Color.white.opacity(0.1))
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .shadow(color: .purple, radius: 15)
                .animation(.linear, value: progress)

                Text(timeString)
                .font(.system(size: 90, weight: .bold))
        }.padding(40)
        
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
