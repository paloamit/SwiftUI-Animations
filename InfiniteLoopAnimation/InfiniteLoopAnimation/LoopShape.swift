//
//  LoopShape.swift
//  InfiniteLoopAnimation
//
//  Created by Amit Palo on 04/08/22.
//

import SwiftUI

struct LoopShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX - rect.width/2, y: rect.midY + rect.height/2.7))
            path.addCurve(to: CGPoint(x: rect.midX - rect.width/2, y: rect.midY - rect.height/2.7), control1: CGPoint(x: rect.midX - rect.width, y: rect.midY + rect.height/2.7), control2: CGPoint(x: rect.midX - rect.width, y: rect.midY - rect.height/2.7))
            path.addCurve(to: CGPoint(x: rect.midX + rect.width/2, y: rect.midY + rect.height/2.7), control1: CGPoint(x: rect.midX , y: rect.midY - rect.height/2.7), control2: CGPoint(x: rect.midX, y: rect.midY + rect.height/2.7))
            path.addCurve(to: CGPoint(x: rect.midX + rect.width/2, y: rect.midY - rect.height/2.7), control1: CGPoint(x: rect.midX + rect.width, y: rect.midY + rect.height/2.7), control2: CGPoint(x: rect.midX + rect.width, y: rect.midY - rect.height/2.7))
            path.addCurve(to: CGPoint(x: rect.midX - rect.width/2, y: rect.midY + rect.height/2.7), control1: CGPoint(x: rect.midX, y: rect.midY - rect.height/2.7), control2: CGPoint(x: rect.midX , y: rect.midY + rect.height/2.7))
        }
    }
}

struct LoopShape_Previews: PreviewProvider {
    static var previews: some View {
        LoopShape()
            .stroke(style: .init(lineWidth: 20,
                                 lineCap: CGLineCap.round))
        .foregroundColor(.black)
        .shadow(color: .white, radius: 10)
        .frame(width: 180, height: 180)
    }
}
