//
//  ContentView.swift
//  RadarAnimation
//
//  Created by Amit Palo on 21/07/22.
//

import SwiftUI


extension Color {
    static var customBackgroundColor: Color {
        Color(red: 237.0/255.0, green: 237.0/255.0, blue: 234.0/255.0)
    }
    
    static var customBlueColor: Color {
        Color(red: 81.0/255.0, green: 142.0/255.0, blue: 210/255.0)
    }
}

extension RadialGradient {
    static var customRadialGradient: RadialGradient {
        RadialGradient(gradient: Gradient(colors: [Color.customBlueColor.opacity(0.2), Color.customBackgroundColor.opacity(0.1)]), center: .center, startRadius: 90, endRadius: -10)
    }
}

extension AngularGradient {
    static var customAngularGradient: AngularGradient {
        AngularGradient(gradient:  Gradient(colors: [Color.blue, Color.customBackgroundColor.opacity(0.05)]), center: .center, startAngle: .degrees(90), endAngle: .degrees(-250))
    }
}

struct ContentView: View {
    
    @State var startAnimation = false
    @State var fadeAnimation1 = false
    @State var fadeAnimation2 = false
    @State var fadeAnimation3 = false
    
    var body: some View {
        ZStack {
            Color.customBackgroundColor.ignoresSafeArea()
            RadarView(isAnimating: $startAnimation, fadeAnimation1: $fadeAnimation1, fadeAnimation2: $fadeAnimation2, fadeAnimation3: $fadeAnimation3)
        }.onAppear(perform: performAnimation)
    }
    
    private func performAnimation() {
        withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
            startAnimation = true
        }
        
        withAnimation(.linear(duration: 0.7)
            .delay((1.5/360) * (90 - 105))
            .repeatForever(autoreverses: true)) {
            fadeAnimation1 = true
        }
        
        withAnimation(.easeInOut(duration: 0.7)
            .delay((1.5/360) * (90 - 80))
            .repeatForever(autoreverses: true)) {
            fadeAnimation2 = true
        }
        
        withAnimation(.linear(duration: 0.5)
            .delay((1.5/360) * (90 - 25))
            .repeatForever(autoreverses: true)) {
            fadeAnimation3 = true
        }
    }
}


struct RadarView: View {
    @Binding var isAnimating: Bool
    @Binding var fadeAnimation1: Bool
    @Binding var fadeAnimation2: Bool
    @Binding var fadeAnimation3: Bool

    var body: some View {
        ZStack {
            Group {
                Circle()
                    .foregroundColor(Color.customBlueColor)
                    .opacity(fadeAnimation1 ? 1.0 : 0.1)
                    .frame(width: 5)
                    .offset(x: 50, y: 0)
                    .rotationEffect(.degrees(45))
                Circle()
                    .foregroundColor(Color.customBlueColor)
                    .opacity(fadeAnimation2 ? 1.0 : 0.1)
                    .frame(width: 10)
                    .offset(x: 40, y: 0)
                    .rotationEffect(.degrees(-125))
                Circle()
                    .foregroundColor(Color.customBlueColor)
                    .opacity(fadeAnimation3 ? 1.0 : 0.1)
                    .frame(width: 14)
                    .offset(x: 60, y: 0)
                    .rotationEffect(.degrees(-35))
            }
            Group {
                Circle()
                    .strokeBorder(.gray, lineWidth: 0.3)
                    .frame(width: 60)
                Circle()
                    .strokeBorder(.gray, lineWidth: 0.3)
                    .frame(width: 130)
                Circle()
                    .strokeBorder(.gray, lineWidth: 0.3)
                    .frame(width: 200)
                Circle()
                    .fill(RadialGradient.customRadialGradient)
                    .frame(width: 200)
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 1, height: 200, alignment: .center)
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 1, height: 200, alignment: .center)
                    .rotationEffect(.degrees(90))
                QuadCircle(start: .degrees(100), end: .degrees(270))
                    .fill(AngularGradient.customAngularGradient)
                    .frame(width: 200)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.customBlueColor)
                    .frame(width: 5, height: 100, alignment: .center)
                    .offset(y: -50)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
            }
        }
    }
}

struct QuadCircle: Shape {
    var start: Angle
    var end: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.midX, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
