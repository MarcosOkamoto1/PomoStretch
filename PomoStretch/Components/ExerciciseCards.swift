//
//  ExerciciseCards.swift
//  PomoStretch
//
//  Created by Academy on 01/04/26.
//

import SwiftUI

struct ExerciciseCards: View {
    let title: String
    let subTitle: String
    let description: String
    let imageName: String
    var isActive: Bool = false
    
    
    var body: some View {
        HStack(spacing: 20) {
            
            
            Image(systemName: "hand.raised.fill")
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.1, green: 0.1, blue: 0.15))
        .cornerRadius(16)
        
        
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isActive ? Color.purple : Color.clear, lineWidth: 2)
        )
        .shadow(color: isActive ? Color.purple.opacity(0.5) : Color.clear, radius: isActive ? 8 : 0)
    }
}


struct ExerciciseCards_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
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
