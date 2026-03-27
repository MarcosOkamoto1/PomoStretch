//
//  TimerView.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack{
            Text("Pomodoro Timer")
            NeonProgressTimer(progress: 1, timeString: "25:00")

        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
