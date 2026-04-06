//
//  PrimaryButton.swift
//  PomoStretch
//
//  Created by Academy on 27/03/26.
//
import Foundation
import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.title)
                .frame(width: 200, height: 56)
                .foregroundColor(.white)
                .background(Color("PurplePrimary")) // Corrigido
                .clipShape(Capsule())
                .shadow(color: Color("PurplePrimary").opacity(0.4), radius: 8, x: 0, y: 4)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Start", action:{})
    }
}
