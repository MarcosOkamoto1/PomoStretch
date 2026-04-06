//
//  ExerciciseCards.swift
//  PomoStretch
//
//  Created by Academy on 01/04/26.
//

import SwiftUI

// MARK: - ExerciciseCards
struct ExerciciseCards: View {
    let title: String
    let subTitle: String
    let description: String
    let imageName: String
    var isActive: Bool = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.raised.fill") // Ícone temporário até usarmos o seu imageName real
                .foregroundColor(Color("SkinTone"))
                .font(.system(size: 30)) // Ícone levemente maior
                .frame(width: 68, height: 68) // Caixa do ícone aumentada para dar mais volume
                .background(Color("SurfaceLight"))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(subTitle)
                    .font(.subheadline) // Mudado de .caption para .subheadline para equilibrar o card maior
                    .foregroundColor(.gray) // Subtítulo alterado para cinza
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(24) // Aumentado de 20 para 24 para deixar o card maior e com mais "respiro"
        .frame(maxWidth: .infinity)
        .background(Color("SurfaceDark"))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isActive ? Color("PurpleNeon") : Color.clear, lineWidth: 2)
        )
        .shadow(color: isActive ? Color("PurpleNeon").opacity(0.3) : Color.clear, radius: 8, x: 0, y: 4)
    }
}

struct ExerciciseCards_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            
            VStack(spacing: 20) {
                ExerciciseCards(
                    title: "Alongamento Punho",
                    subTitle: "Alivia tensão",
                    description: "Puxe os dedos para trás",
                    imageName: "mao_baixo",
                    isActive: false
                )
                
                ExerciciseCards(
                    title: "Abre e Fecha",
                    subTitle: "Melhora a circulação",
                    description: "Abra e feche a mão 10x",
                    imageName: "mao_aberta",
                    isActive: true
                )
            }
            .padding()
        }
    }
}
