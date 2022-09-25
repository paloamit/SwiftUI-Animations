//
//  ContentView.swift
//  LoadingSemiCircleAnimation
//
//  Created by Amit Palo on 22/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotationAngle: Double = 180
    @State private var animateOffset = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Circle()
                .trim(from: 0, to: 0.5)
                .frame(width: 150)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(rotationAngle))
            Circle()
                .frame(width: 25)
                .offset(x: 65, y: (animateOffset ? -25 : -200))
                .foregroundColor(.white)
            Circle()
                .frame(width: 25)
                .offset(x: -65, y: (animateOffset ? 200 : 25))
                .foregroundColor(.white)
        }.onAppear() {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                rotationAngle -= 360
            }
            
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                animateOffset.toggle()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

