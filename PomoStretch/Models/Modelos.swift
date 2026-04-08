import Foundation

struct Exercise: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let targetArea: String
    let sets: Int
    let repsOrDuration: String
    let imageName: String
}

struct ExerciseData {
    static let shortBreakExercises: [Exercise] = [
        Exercise(
            title: "Abertura de Palmas",
            description: "Abra bem as mãos, afastando todos os dedos ao máximo. Mantenha a tensão por alguns segundos e feche suavemente.",
            targetArea: "Dedos e Mãos",
            sets: 2,
            repsOrDuration: "10 segundos",
            imageName: "mao1-Photoroom"
        ),
        Exercise(
            title: "Rotação de Punho",
            description: "Com as mãos fechadas, realize movimentos circulares lentos para fora e depois para dentro.",
            targetArea: "Articulação do Punho",
            sets: 2,
            repsOrDuration: "10 repetições por lado",
            imageName: "mao2-Photoroom"
        ),
        Exercise(
            title: "Extensão Vertical",
            description: "Aponte os dedos para o teto e use a outra mão para puxar levemente o dorso da mão em sua direção.",
            targetArea: "Extensores do Punho",
            sets: 1,
            repsOrDuration: "15 segundos por lado",
            imageName: "mao3-Photoroom"
        )
    ]
    
    static let longBreakExercises: [Exercise] = [
        Exercise(
            title: "Alongamento Flexor",
            description: "Braço esticado à frente, palma para cima. Puxe os dedos para baixo em direção ao corpo.",
            targetArea: "Antebraço e Tendões",
            sets: 4,
            repsOrDuration: "30 seg por lado",
            imageName: "mao4-Photoroom"
        ),
        Exercise(
            title: "Oposição de Polegar",
            description: "Envolva o polegar com os outros dedos formando um punho e incline o pulso lateralmente.",
            targetArea: "Base do Polegar",
            sets: 3,
            repsOrDuration: "25 seg por lado",
            imageName: "mao5-Photoroom"
        ),
        Exercise(
            title: "Alívio Cervical",
            description: "Incline a cabeça lateralmente aproximando a orelha do ombro. Mantenha o braço oposto esticado para baixo.",
            targetArea: "Pescoço e Trapézio",
            sets: 3,
            repsOrDuration: "30 seg por lado",
            imageName: "mao6-Photoroom"
        )
    ]
}
