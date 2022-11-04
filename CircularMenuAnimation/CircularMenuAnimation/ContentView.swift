//
//  ContentView.swift
//  CircularMenuAnimation
//
//  Created by Amit Palo on 04/11/22.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            CircluarMenuButton(radius: 60.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
