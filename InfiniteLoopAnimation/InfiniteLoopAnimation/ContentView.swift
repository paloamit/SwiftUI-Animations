//
//  ContentView.swift
//  InfiniteLoopAnimation
//
//  Created by Amit Palo on 03/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstFrom: CGFloat = 0
    @State private var firstTo: CGFloat = 0.05
    @State private var secondFrom: CGFloat = 0
    @State private var secondTo: CGFloat = 0.05
    @State private var isHidden = false
    @State private var firstOpacity = true
    @State private var secondOpacity = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LoopShape()
                .stroke(style: .init(lineWidth: 20,
                                     lineCap: CGLineCap.round))
                .foregroundColor(.white)
                .shadow(color: .white, radius: 10)
                .frame(width: 180, height: 180)
                .overlay( ZStack { LoopShape()
                        .trim(from: firstFrom, to: firstTo)
                        .stroke(style: .init(lineWidth: 14, lineCap: CGLineCap.round))
                        .foregroundColor(.green)
                        .shadow(color: .green, radius: 10)
                        .frame(width: 180, height: 180)
                        .opacity(firstOpacity ? 1 : 0)
                    LoopShape()
                        .trim(from: secondFrom, to: secondTo)
                        .stroke(style: .init(lineWidth: 14, lineCap: CGLineCap.round))
                        .foregroundColor(.green)
                        .shadow(color: .green, radius: 10)
                        .frame(width: 180, height: 180)
                        .opacity(secondOpacity ? 1 : 0)
                })
        }.task {
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                if firstOpacity {
                    withAnimation(.linear) {
                        firstFrom = firstTo
                        firstTo += 0.1
                    }
                } else {
                    firstFrom = 0
                    firstTo = 0
                }
                
                if firstFrom > 1.0 {
                    firstOpacity.toggle()
                    secondOpacity.toggle()
                    secondTo = 0
                    secondFrom = 0
                }
                
                if secondOpacity {
                    withAnimation(.linear) {
                        secondFrom = secondTo
                        secondTo += 0.1
                    }
                } else {
                    secondFrom = 0
                    secondTo = 0
                }
                
                if secondFrom > 1.0 {
                    firstOpacity.toggle()
                    secondOpacity.toggle()
                    firstTo = 0
                    firstFrom = 0
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

