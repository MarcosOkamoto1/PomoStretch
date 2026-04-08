import SwiftUI
import Foundation
import UserNotifications
import AVFoundation

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
    var audioPlayer: AVAudioPlayer?
    
    @Published var focusDuration: Int {
        didSet {
            UserDefaults.standard.set(focusDuration, forKey: "focusDuration")
            if actualSession == .focus && !isRunning { resetTimer() }
        }
    }
    
    @Published var shortPauseDuration: Int {
        didSet {
            UserDefaults.standard.set(shortPauseDuration, forKey: "shortPauseDuration")
            if actualSession == .shortPause && !isRunning { resetTimer() }
        }
    }
    
    @Published var longPauseDuration: Int {
        didSet {
            UserDefaults.standard.set(longPauseDuration, forKey: "longPauseDuration")
            if actualSession == .longPause && !isRunning { resetTimer() }
        }
    }
    
    @Published var targetSessions: Int {
        didSet { UserDefaults.standard.set(targetSessions, forKey: "targetSessions") }
    }
    
    init() {
        self.focusDuration = UserDefaults.standard.object(forKey: "focusDuration") as? Int ?? 25
        self.shortPauseDuration = UserDefaults.standard.object(forKey: "shortPauseDuration") as? Int ?? 5
        self.longPauseDuration = UserDefaults.standard.object(forKey: "longPauseDuration") as? Int ?? 30
        self.targetSessions = UserDefaults.standard.object(forKey: "targetSessions") as? Int ?? 3
        
        self.totalTime = (UserDefaults.standard.object(forKey: "focusDuration") as? Int ?? 25) * 60
        self.timeRemaining = self.totalTime
        
        requestNotificationPermission()
    }
    
    // MARK: - Notification Permission
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Alarm Sound (Ping.aiff)
    
    func playAlarm() {
        if let url = URL(string: "/System/Library/Sounds/Ping.aiff"), FileManager.default.fileExists(atPath: url.path) {
            playSound(url: url)
        } else {
            let systemSoundID: SystemSoundID = 1057
            AudioServicesPlaySystemSound(systemSoundID)
        }
    }
    
    private func playSound(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = 2
            audioPlayer?.play()
        } catch {
            print("Erro ao reproduzir som: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Local Notification
    
    func sendNotification(title: String, body: String) {
        let notificationsEnabled = UserDefaults.standard.object(forKey: "notificationsEnabled") as? Bool ?? true
        guard notificationsEnabled else { return }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound(named: UNNotificationSoundName("Ping.aiff"))
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao enviar notificação: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Notification Messages
    
    private func notifySessionEnd() {
        switch actualSession {
        case .focus:
            let nextIs = (sessionNumber >= targetSessions) ? "Pausa longa" : "Pausa curta"
            sendNotification(
                title: "🧘 Hora de alongar, Luyse!",
                body: "Foco concluído! Aproveite sua \(nextIs)."
            )
        case .shortPause:
            sendNotification(
                title: "✅ Pausa encerrada",
                body: "Bora focar! Sessão \(sessionNumber) de \(targetSessions)."
            )
        case .longPause:
            sendNotification(
                title: "🔋 Recarregado!",
                body: "Pausa longa finalizada. Pronto para um novo ciclo?"
            )
        }
        
        playAlarm()
    }
    
    // MARK: - Timer Logic
    
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
                
                self.notifySessionEnd()
                
                if self.actualSession == .focus {
                    self.sessionNumber += 1
                    if self.sessionNumber > self.targetSessions {
                        self.setLongPause()
                        self.sessionNumber = 1
                    } else {
                        self.setShortPause()
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name("SwitchToStretch"), object: nil)
                    
                } else if self.actualSession == .shortPause {
                    self.setFocus(autoStart: true)
                } else {
                    // Pausa longa encerrada: aguarda o usuário iniciar manualmente
                    self.setFocus(autoStart: false)
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
    
    func setFocus(autoStart: Bool = false) {
        pauseTimer()
        actualSession = .focus
        totalTime = focusDuration * 60
        timeRemaining = totalTime
        neonRingTimerProgress()
        if autoStart { startTimer() }
    }
    
    func resetTimer() {
        pauseTimer()
        sessionNumber = 1
        switch actualSession {
        case .focus:
            totalTime = focusDuration * 60
        case .shortPause:
            totalTime = shortPauseDuration * 60
        case .longPause:
            totalTime = longPauseDuration * 60
        }
        timeRemaining = totalTime
        progress = 1.0
    }
}
