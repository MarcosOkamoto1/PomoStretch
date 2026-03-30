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
            action(
                
            )
        }) {
            Text(title)
                .font(.title)
                .frame(width: 200, height: 56)
                .foregroundColor(.white)
                .background(Color.purple)
                .clipShape(Capsule())
                
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Start", action:{})
    }
}
