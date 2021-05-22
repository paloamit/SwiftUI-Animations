//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { render in
            ZStack {
                Group {
                    AnimatedCircle(radius: 1)
                    AnimatedCircle(radius: 10)
                    AnimatedCircle(radius: 20)
                    AnimatedCircle(radius: 30)
                    AnimatedCircle(radius: 40)
                    AnimatedCircle(radius: 50)
                    AnimatedCircle(radius: 60)
                    AnimatedCircle(radius: 70)
                }
                Group {
                    AnimatedCircle(radius: 80)
                    AnimatedCircle(radius: 90)
                    AnimatedCircle(radius: 100)
                    AnimatedCircle(radius: 110)
                    AnimatedCircle(radius: 120)
                    AnimatedCircle(radius: 130)
                    AnimatedCircle(radius: 140)
                    AnimatedCircle(radius: 150)
                }
                Group {
                    AnimatedCircle(radius: 160)
                    AnimatedCircle(radius: 170)
                    AnimatedCircle(radius: 180)
                    AnimatedCircle(radius: 190)
                    AnimatedCircle(radius: 200)
                    AnimatedCircle(radius: 210)
                    AnimatedCircle(radius: 220)
                    AnimatedCircle(radius: 230)
                }
                Group {
                    AnimatedCircle(radius: 240)
                    AnimatedCircle(radius: 250)
                    AnimatedCircle(radius: 260)
                    AnimatedCircle(radius: 270)
                    AnimatedCircle(radius: 280)
                    AnimatedCircle(radius: 290)
                    AnimatedCircle(radius: 300)
                    AnimatedCircle(radius: 310)
                }
            }
            .frame(width: render.size.width, height: render.size.height)
            .background(Color.black)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimatedCircle: View {
    @State var isAnimated = false
    @State var radius: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: isAnimated ? 1.0 : 0.5)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 3.0))
                .frame(width: radius)
                .rotationEffect(.degrees(90))
            Circle()
                .trim(from: 0.5, to: isAnimated ? 1.0 : 0.5)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 3.0))
                .frame(width: radius)
                .rotationEffect(.degrees(270))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 1.0, y: 0.0, z: 0.0))

        }.animation(Animation.easeIn(duration: 2)
                        .delay(Double(3*Double(radius/310))))
        .onAppear() {
            isAnimated.toggle()
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
                isAnimated.toggle()
            }
        }
    }
}
