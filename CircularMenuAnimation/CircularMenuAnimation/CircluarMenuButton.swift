//
//  CircluarMenuButton.swift
//  CircularMenuAnimation
//
//  Created by Amit Palo on 05/11/22.
//

import SwiftUI

struct CircluarMenuButton: View {
    @State var radius: CGFloat
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Circle()
                .scale(animate ? 1.0 : 0.35)
                .foregroundColor(Color.fadeBlackColor)
                .frame(width: radius*3)
            Group {
                CircluarMenuButtonItem(imageName: "clock.badge.checkmark",
                                       handler: { _ in
                    animateToggle()
                })
                .frame(width: radius/2)
                .offset(y: animate ? radius : 0)
                CircluarMenuButtonItem(imageName: "cart", handler: { _ in
                    animateToggle()
                })
                .frame(width: radius/2)
                .offset(y: animate ? -radius : 0)
                CircluarMenuButtonItem(imageName: "message", handler: { _ in
                    animateToggle()
                })
                .frame(width: radius/2)
                .offset(x: animate ? radius : 0)
                CircluarMenuButtonItem(imageName: "person", handler: { _ in
                    animateToggle()
                })
                .frame(width: radius/2)
                .offset(x: animate ? -radius : 0)
            }
            Circle()
                .scale(animate ? 1.0 : 0.8)
                .foregroundColor(.white)
                .frame(width: radius)
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: radius/2)
                .rotationEffect(.degrees(animate ? 45 : 0))
        }.onTapGesture {
            animateToggle()
        }
    }
    
    private func animateToggle() {
        withAnimation(.spring().speed(2)) {
            animate.toggle()
        }
    }
}

private struct CircluarMenuButtonItem: View {
    @State var imageName: String
    var handler: (String) -> Void
    var body: some View {
        Button {
            print("\(imageName) clicked")
            handler(imageName)
        } label: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        }
    }
}
