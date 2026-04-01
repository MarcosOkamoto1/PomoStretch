//
//  StretchView.swift
//  PomoStretch
//
//  Created by Academy on 01/04/26.
//

import SwiftUI

struct StretchView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            
            VStack{
                Text("Rotina de Prevenção")
                Text("Alongamentos para alivar tendões e articulações")
            }.foregroundColor(.white)
        }
    }
}

struct StretchView_Previews: PreviewProvider {
    static var previews: some View {
        StretchView()
    }
}
