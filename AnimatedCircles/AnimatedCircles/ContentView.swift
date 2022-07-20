//
//  ContentView.swift
//  AnimatedCircles
//
//  Created by Amit Palo on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var width: CGFloat = 60
    @State var status: [Bool] = Array(repeating: false, count: 7)
    private let offset = CGSize(width: -15, height: -15)
    @State var timer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()
    @State var delayTime: Double = 0
    private let customGrayColor = Color(red: 195.0/255.0, green: 195.0/255.0, blue: 195.0/255.0, opacity: 1)
    private let customBlueColor = Color(red: 43.0/255.0, green: 45.0/255.0, blue: 195.0/255.0, opacity: 1)
    
    var body: some View {
        ZStack {
            customGrayColor.ignoresSafeArea()
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor, lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[0] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[1] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[2] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[3] ? offset : .zero)
                    }
                }
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[1] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[2] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[3] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[4] ? offset : .zero)
                    }
                }
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[2] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[3] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[4] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[5] ? offset : .zero)
                    }
                }
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[3] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[4] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[5] ? offset : .zero)
                    }
                    ZStack {
                        Circle()
                            .frame(width: width, height: width)
                            .foregroundColor(customBlueColor)
                        Circle()
                            .strokeBorder(customBlueColor,lineWidth: 2)
                            .frame(width: width, height: width)
                            .background(Circle().foregroundColor(customGrayColor))
                            .offset(status[6] ? offset : .zero)
                    }
                }
            }
        }
        .onAppear(perform: performAnimation)
        .onReceive(timer) { _ in
            delayTime = 0
            performAnimation()
        }
    }
    
    private func performAnimation() {
        for i in 0..<status.count {
            doAnimation(delay: delayTime, value: offset, index: i)
            delayTime += 0.3
        }
    }
    
    private func doAnimation(delay: Double, value: CGSize, index: Int) {
        withAnimation(Animation
            .easeOut(duration: 0.5)
            .delay(delayTime)) {
                status[index].toggle()
            }
        
        withAnimation(Animation
            .easeInOut(duration: 0.5)
            .delay(delayTime + 0.5)) {
                status[index].toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
