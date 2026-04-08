import SwiftUI
import Foundation

class TimerViewModel: ObservableObject {
    enum currentSession {
        case focus
        case longPause
        case shortPause
    }
    
    @Published var progress: CGFloat = 1.0
    @Published var timeRemaining: Int = 25 * 60
    @Published var isRunning: Bool = false
    @Published var actualSession: currentSession = .focus
    @Published var sessionNumber: Int = 1
    
    var totalTime = 25 * 60
    var timer: Timer?
    
    @Published var focusDuration: Int {
        didSet {
            UserDefaults.standard.set(focusDuration, forKey: "focusDuration")
            if actualSession == .focus && !isRunning { resetTimer() }
        }
    }
    
    @Published var shortPauseDuration: Int {
        didSet { UserDefaults.standard.set(shortPauseDuration, forKey: "shortPauseDuration") }
    }
    
    @Published var longPauseDuration: Int {
        didSet { UserDefaults.standard.set(longPauseDuration, forKey: "longPauseDuration") }
    }
    
    @Published var targetSessions: Int {
        didSet { UserDefaults.standard.set(targetSessions, forKey: "targetSessions") }
    }
    
    init() {
        self.focusDuration = UserDefaults.standard.object(forKey: "focusDuration") as? Int ?? 25
        self.shortPauseDuration = UserDefaults.standard.object(forKey: "shortPauseDuration") as? Int ?? 5
        self.longPauseDuration = UserDefaults.standard.object(forKey: "longPauseDuration") as? Int ?? 30
        self.targetSessions = UserDefaults.standard.object(forKey: "targetSessions") as? Int ?? 3
        
        self.totalTime = self.focusDuration * 60
        self.timeRemaining = self.totalTime
    }
    
    func startTimer() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.neonRingTimerProgress()
            } else {
                self.timer?.invalidate()
                self.isRunning = false
                
                if self.actualSession == .focus {
                    self.sessionNumber += 1
                    if self.sessionNumber > self.targetSessions {
                        self.setLongPause()
                        self.sessionNumber = 1
                    } else {
                        self.setShortPause()
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name("SwitchToStretch"), object: nil)
                    
                } else {
                    self.setFocus()
                }
            }
        }
    }
    
    func timeString() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func pauseTimer() {
        timer?.invalidate()
        isRunning = false
    }
    
    func neonRingTimerProgress() {
        progress = CGFloat(timeRemaining) / CGFloat(totalTime)
    }
    
    func setShortPause() {
        pauseTimer()
        actualSession = .shortPause
        totalTime = shortPauseDuration * 60
        timeRemaining = totalTime
        neonRingTimerProgress()
    }
    
    func setLongPause() {
        pauseTimer()
        actualSession = .longPause
        totalTime = longPauseDuration * 60
        timeRemaining = totalTime
        neonRingTimerProgress()
    }
    
    func setFocus() {
        pauseTimer()
        actualSession = .focus
        totalTime = focusDuration * 60
        timeRemaining = totalTime
        neonRingTimerProgress()
        startTimer()
    }
    
    func resetTimer() {
        pauseTimer()
        actualSession = .focus
        sessionNumber = 1
        totalTime = focusDuration * 60
        timeRemaining = totalTime
        progress = 1.0
    }
}
