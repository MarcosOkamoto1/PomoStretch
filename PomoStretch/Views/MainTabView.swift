//
//  MainTabView.swift
//  PomoStretch
//
//  Created by Academy on 01/04/26.
//

import SwiftUI
import Foundation

struct MainTabView: View {
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            Text("Tela de Exercícios em Construção 🚧")
                .font(.headline)
                .tabItem {
                    Label("Stretch", systemImage: "figure.walk")
                }
        }
        .accentColor(.purple)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
