//
//  ContentView.swift
//  PomoStretch
//
//  Created by Academy on 03/04/26.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    @StateObject var viewModel = TimerViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("BackgroundDark").ignoresSafeArea()
            
            // Aqui carregamos as telas. O Spacer de 100 no final garante que
            // o conteúdo das outras abas (como a lista de exercícios) não fique escondido atrás da Tab Bar.
            VStack(spacing: 0) {
                if selectedTab == 0 {
                    TimerView(viewModel: viewModel)
                } else if selectedTab == 1 {
                    StretchView()
                } else {
                    SettingsView(viewModel: viewModel)
                }
                Spacer().frame(height: 100)
            }
            .ignoresSafeArea(edges: .bottom)
            
            // Tab Bar Fixa na mesma posição para todas as abas
            HStack(spacing: 0) {
                TabBarButton(iconName: "timer", title: "Timer", isSelected: selectedTab == 0) { selectedTab = 0 }
                TabBarButton(iconName: "figure.walk", title: "Exercícios", isSelected: selectedTab == 1) { selectedTab = 1 }
                TabBarButton(iconName: "gearshape", title: "Ajustes", isSelected: selectedTab == 2) { selectedTab = 2 }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color("SurfaceDark"))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 8)
            .padding(.horizontal, 24)
            .padding(.bottom, 16) // <-- Margem FIXA. A barra nunca mais vai sair do lugar!
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("SwitchToStretch"))) { _ in
            self.selectedTab = 1
        }
    }
}

struct TabBarButton: View {
    let iconName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: iconName)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? Color("PurpleNeon") : .gray)
                    .shadow(color: isSelected ? Color("PurpleNeon").opacity(0.6) : .clear, radius: 5)
                
                Text(title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(isSelected ? Color("PurpleNeon") : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
