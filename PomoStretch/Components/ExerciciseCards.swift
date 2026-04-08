//
//  ExerciciseCards.swift
//  PomoStretch
//
//  Created by Academy on 01/04/26.
//

import SwiftUI


struct ExerciciseCards: View {
    let title: String
    let description: String
    let imageName: String
    var isActive: Bool = false
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(imageName)
                .resizable()
               
                .scaledToFill()
                .frame(width: 86, height: 86)
                .clipped()
                .background(Color("SurfaceLight"))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(24)
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
                    description: "Puxe os dedos para trás",
                    imageName: "mao2-Photoroom",
                    isActive: false
                )
                
                ExerciciseCards(
                    title: "Abre e Fecha",
                    description: "Abra e feche a mão 10x",
                    imageName: "mao1-Photoroom",
                    isActive: true
                )
            }
            .padding()
        }
    }
}
