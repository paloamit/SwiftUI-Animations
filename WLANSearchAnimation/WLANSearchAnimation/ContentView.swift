//

import SwiftUI

struct ContentView: View {
    private let backgroundColor = Color(red: 106/255, green: 93/255, blue: 245/255)
    private let backgroundCircleRadius: CGFloat = 130
    private let startRadius: CGFloat = 80
    private let padding: CGFloat = 25
    private let yOffset: CGFloat = 15
    @State var animate: Bool = false
    @State var animateHorizantally: Bool = false
    @State var xOffset: CGFloat = 15

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            Text("WLAN Search Animation")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .offset(y: -150.0)
            Circle().frame(width: backgroundCircleRadius)
            ZStack {
                Arc(radius: CGFloat(startRadius - 0*padding))
                    .offset(x: animateHorizantally ? xOffset : 0,
                            y: animate ? 2*yOffset : 0)
                Arc(radius: CGFloat(startRadius - 1*padding))
                    .rotationEffect(.degrees(animate ? 180 : 0))
                    .offset(x: animateHorizantally ? xOffset : 0)
                Arc(radius: CGFloat(startRadius - 2*padding))
                    .offset(x: animateHorizantally ? xOffset : 0,
                            y: animate ? 1.2*yOffset : 0)
                Circle()
                    .frame(width: 10)
                    .foregroundColor(.white)
                    .offset(x: animateHorizantally ? 1.2*xOffset : 0,
                            y: animate ? yOffset : 0)
            }.offset(y: animate ? -10.0 : 0)
        }
        .onTapGesture {
            animateView()
            Timer.scheduledTimer(withTimeInterval: 1.4, repeats: true) { _ in
                animateView()
            }
        }
    }

    func animateView() {
        withAnimation(Animation.easeInOut(duration: 0.2)) {
            animate.toggle()
        }

        if animate {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    xOffset = -15
                    animateHorizantally.toggle()
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    animateHorizantally.toggle()
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    xOffset = 15
                    animateHorizantally.toggle()
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    animateHorizantally.toggle()
                }
            }
        }
    }
}

struct Arc: View {
    @State var lineWidth: CGFloat = 5.0
    @State var stokeColor: Color = .white
    @State var radius: CGFloat

    var body: some View {
        Circle()
            .trim(from: 0.2, to: 0.5)
            .rotation(.degrees(145))
            .stroke(stokeColor, style: StrokeStyle(lineWidth: lineWidth,
                                                   lineCap: .round))
            .frame(width: radius)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
