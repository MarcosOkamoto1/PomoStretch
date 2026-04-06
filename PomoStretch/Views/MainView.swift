//
//  MainView.swift
//  PomoStretch
//
//  Created by Academy on 06/04/26.
//

import SwiftUI
import Foundation

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("BackgroundDark").ignoresSafeArea()
            
            VStack(spacing: 0) {
                if selectedTab == 0 {
                    TimerView()
                } else if selectedTab == 1 {
                    StretchView()
                } else {
                    SettingsView()
                }
                
                Spacer().frame(height: 80)
            }
            .ignoresSafeArea(edges: .bottom)
            
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
            
            .padding(.bottom, 0)
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
