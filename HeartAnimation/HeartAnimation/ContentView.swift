//
//  ContentView.swift
//  HeartAnimation
//
//  Created by Amit Palo on 15/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstFrom: CGFloat = 0.001
    @State private var firstTo: CGFloat = 0.1
    @State private var randomColor = Color.red
    
    var body: some View {
        ZStack {
            randomColor.opacity(0.2).ignoresSafeArea()
            HeartShape()
                .stroke(.white,
                        style: .init(lineWidth: 8, lineCap: .round))
                .frame(width: 200)
                .shadow(color: randomColor, radius: 15)
            HeartShape()
                .trim(from: firstFrom, to: firstTo)
                .stroke(style: .init(lineWidth: 7, lineCap: CGLineCap.round))
                .frame(width: 200)
                .foregroundColor(randomColor)
                .shadow(color: randomColor, radius: 5)
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                if firstTo < 1.0 {
                    withAnimation(.linear) {
                        firstFrom = firstTo
                        firstTo += 0.1
                    }
                } else {
                    firstFrom = 0
                    firstTo = 0
                    randomColor = Color.random
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
