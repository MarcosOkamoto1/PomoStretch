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
            StretchView()
                .tabItem {
                    Label("Stretch", systemImage: "figure.walk")
                }
        }
        .accentColor(.purple)
        .preferredColorScheme(.dark)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
