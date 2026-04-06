//
//  StretchView.swift
//  PomoStretch
//
//  Created by Academy on 01/04/26.
//

import SwiftUI
import Foundation

import SwiftUI

struct StretchView: View {
    var body: some View {
        ZStack {
            Color("BackgroundDark").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 28) {
                    
                    VStack(spacing: 8) {
                        Text("Rotina de Prevenção")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Alongamentos para aliviar tendões e articulações")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 40)
                    
                    CapsuleIndicator(text: "Short Pause (5 min)", iconName: "cup.and.saucer.fill")
                    
                    ExerciciseCards(title: "Abre e Fecha...",
                                    subTitle: "Melhora a circulação",
                                    description: "Abra e feche as mãos 10x.",
                                    imageName: "mao_aberta",
                                    isActive: true)
                    
                    ExerciciseCards(title: "Alongamento Punho",
                                    subTitle: "Estica o antebraço",
                                    description: "Mão para baixo, puxe os dedos.",
                                    imageName: "mao_baixo")
                    
                    ExerciciseCards(title: "Elevação Punho",
                                    subTitle: "Alivia tensão",
                                    description: "Mão para cima, puxe os dedos.",
                                    imageName: "mao_cima")
                    
                    CapsuleIndicator(text: "Long Pause (20 min)", iconName: "moon.stars.fill")
                        .padding(.top, 16)
                    
                    ExerciciseCards(title: "Liberação...",
                                    subTitle: "Relaxa a palma",
                                    description: "Massageie o centro da mão.",
                                    imageName: "mao_meio")
                    
                    ExerciciseCards(title: "Rotação...",
                                    subTitle: "Lubrifica a articulação",
                                    description: "Gire os punhos 5x para cada lado.",
                                    imageName: "mao_girando")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }
}

struct StretchView_Previews: PreviewProvider {
    static var previews: some View {
        StretchView()
    }
}
