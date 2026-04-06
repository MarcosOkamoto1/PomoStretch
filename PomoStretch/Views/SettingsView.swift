import SwiftUI

struct SettingsView: View {
    @AppStorage("focusDuration") private var focusDuration: Int = 25
    @AppStorage("shortBreakDuration") private var shortBreakDuration: Int = 5
    @AppStorage("longBreakDuration") private var longBreakDuration: Int = 20
    @AppStorage("cyclesBeforeLongBreak") private var cycles: Int = 4
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true
    
    var body: some View {
        Form {
            Section(header: Text("Tempos do Pomodoro (Minutos)")) {
                Stepper("Tempo de Foco: \(focusDuration) min", value: $focusDuration, in: 10...60, step: 5)
                Stepper("Pausa Curta: \(shortBreakDuration) min", value: $shortBreakDuration, in: 1...15, step: 1)
                Stepper("Pausa Longa: \(longBreakDuration) min", value: $longBreakDuration, in: 10...45, step: 5)
            }
            
            Section(header: Text("Ciclos")) {
                Stepper("Ciclos até a pausa longa: \(cycles)", value: $cycles, in: 1...8, step: 1)
            }
            
            Section(header: Text("Avisos"), footer: Text("Lembre-se de aceitar as permissões de notificação do sistema para ser avisado sobre os alongamentos.")) {
                Toggle("Ativar Notificações", isOn: $notificationsEnabled)
                    .tint(.purple)
            }
        }
        .navigationTitle("Configurações")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
