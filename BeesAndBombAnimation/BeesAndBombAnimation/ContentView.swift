//
//  ContentView.swift
//  BeesAndBombAnimation
//
//  Created by Amit Palo on 13/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating = false
    private let count: Int = 12
    private let size: CGFloat = 50.0
    private let radius: CGFloat = 120.0
    
    var body: some View {
        ZStack {
            ForEach(0..<count) { i in
                BeesAndBomb(radius: radius,
                            size: size,
                            index: i,
                            rotation: Double(360/count * i))
            }
        }
        .rotationEffect(.degrees(isAnimating ? -360 : 0))
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(Animation.linear(duration: 18.0)
                                .repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
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

struct BeesAndBomb: View {
    @State var radius: CGFloat
    @State var size: CGFloat
    @State var isAnimating: Bool = false
    @State var index: Int
    @State var rotation: Double
    private let color = Color( red: 167/255.0, green: 61/255.0, blue: 41.0/255.0)
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size)
                .scaleEffect(isAnimating ? 1 :  0.5)
                .offset(y: radius)
                .foregroundColor(color)
                .rotationEffect(.degrees(rotation))
                .opacity(isAnimating ? 1 : 0.5)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                animate()
                Timer.scheduledTimer(withTimeInterval: 0.55, repeats: true) { _ in
                    animate()
                }
            }
        }
    }
    
    func animate() {
        withAnimation(Animation
                        .linear(duration: 0.3)
                        .delay(0.08*Double(index))) {
            isAnimating.toggle()
        }
    }
}
