//
//  TimerViewModel.swift
//  PomoStretch
//
//  Created by Academy on 30/03/26.
//

import SwiftUI
import Foundation


class TimerViewModel: ObservableObject {
    enum currentSession{
        case focus
        case longPause
        case shortPause
    }
    
    @Published var progress: CGFloat = 1.0
    @Published var timeRemaining : Int = 25 * 60
    @Published var isRunning : Bool = false
    @Published var actualSession: currentSession = .focus
    @Published var sessionNumber: Int = 1
    
    
    let totalSessions = 3
    var totalTime = 25 * 60
    
    var timer: Timer?
    
    func startTimer(){
        guard !isRunning else {return}
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.neonRingTimerProgress()
            }else{
                self.timer?.invalidate()
                self.isRunning = false
                
                if self.actualSession == .focus{
                    self.sessionNumber += 1
                    if self.sessionNumber > self.totalSessions{
                        self.setLongPause()
                        self.sessionNumber = 1
                    } else {
                        self.setShortPause()
                    }
                    
                } else{
                    self.setFocus()
                }
            }
        }
        
    }
    
    func timeString() -> String{
        let minutes = timeRemaining/60
        let seconds = timeRemaining % 60
        
        return String(format: "%02d:%02d", minutes,seconds)
        
    }
    
    func pauseTimer() {
        timer?.invalidate()
        isRunning = false
    }
    
    func neonRingTimerProgress(){
        progress = CGFloat(timeRemaining) / CGFloat(totalTime)
    }
    
    func setShortPause(){
        pauseTimer()
        actualSession = .shortPause
        
        totalTime = 5 * 60
        timeRemaining = totalTime
        
        neonRingTimerProgress()
        startTimer()
    }
    
    func setLongPause(){
        pauseTimer()
        actualSession = .longPause
        
        totalTime = 30 * 60
        timeRemaining = totalTime
        
        neonRingTimerProgress()
        startTimer()
    }
    
    func setFocus(){
        pauseTimer()
        actualSession = .focus
        
        totalTime = 25 * 60
        timeRemaining = totalTime
        
        neonRingTimerProgress()
        startTimer()
    }
}
