//

import SwiftUI

struct ContentView: View {
    private let backgroundColor = Color.white
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            DownloadCircle(color: Color.blue, radius: 130, strokeLineWidth: 4)

        }
    }
}

struct DownloadCircle: View {
    @State var color: Color
    @State var radius: CGFloat
    @State var strokeLineWidth: CGFloat
    @State private var animate = false
    @State private var left: CGPoint = CGPoint(x: 10, y: 35)
    @State private var right: CGPoint = CGPoint(x: 42, y: 35)
    @State private var height: CGFloat = 0
    @State private var rotation: Double = 180
    @State private var offset: (CGFloat, CGFloat) = (0, 0)
    @State private var showCorrectArrow = false
    @State private var percent = -15.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    @State private var showText = false
    @State private var hideArrow = false

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(color.opacity(0.3))
                    .frame(width: radius)
                ZStack {
                    Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                        .fill(color)
                        .opacity(0.2)
                        .frame(width: radius, height: radius)
                    Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(percent)/100)
                        .fill(color)
                        .opacity(0.5)
                        .frame(width: radius, height: radius)
                }
                .mask(Circle().frame(width: radius))
                Circle()
                    .trim(from: 0, to: animate ? 1 : 0)
                    .stroke(color, lineWidth: strokeLineWidth)
                    .animation(Animation.easeInOut(duration: 3))
                    .frame(width: radius+strokeLineWidth+5)
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(.degrees(180), axis: (x: 1.0, y: 0.0, z: 0.0))
                Arrow(left: left, right: right, height: height)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: strokeLineWidth, lineCap: .round))
                    .frame(width: radius/2.5, height: radius/2.5)
                    .offset(x: 0, y: offset.1)
                    .rotationEffect(.degrees(rotation))
                    .opacity(animate ? 0 : 1)
                    .scaleEffect(hideArrow ? 0.0 : 1.0)
                CorrectMark()
                    .trim(from: 0, to: showCorrectArrow ? 1 : 0)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: strokeLineWidth, lineCap: .round))
                    .animation(.easeInOut(duration: 0.5))
                    .frame(width: radius/2.5, height: radius/2.5)
                    .offset(x: -5, y: -6)
                    .opacity(showCorrectArrow ? 1 : 0)
                Text("\(Int(percent) > 0 ? (Int(percent) > 100 ? 100 : Int(percent)) : 0) %")
                    .font(.title)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .frame(width: radius)
                    .opacity(showText ? 1 : 0)
            }.onTapGesture(perform: {
                withAnimation(Animation.linear(duration: 0.3)) {
                    offset.1 = 92
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    hideArrow.toggle()
                    withAnimation(Animation.easeInOut(duration: 0.3)) {
                        animate.toggle()
                        showText.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                        if percent < 115 {
                            withAnimation(Animation.linear(duration: 0.03)) {
                                percent += 0.9
                            }
                        }
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                    showText.toggle()
                    withAnimation(Animation.easeInOut(duration: 0.3)) {
                        showCorrectArrow.toggle()
                    }
                }
            })
        }.onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -180)
            }
        }
    }
}

struct Arrow: Shape {
    var left: CGPoint
    var right: CGPoint
    var height: CGFloat

    var animatableData: AnimatablePair<CGFloat, AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData>> {
        get { (AnimatablePair(height, AnimatablePair(left.animatableData, right.animatableData))) }
        set {
            height = newValue.first
            right.animatableData = newValue.second.first
            left.animatableData = newValue.second.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: height))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))

        path.move(to: left)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))

        path.addLine(to: right)

        return path
    }
}

struct Wave: Shape {
    var offset: Angle
    var percent: Double

    var animatableData: Double {
        get {
            offset.degrees
        }
        set {
            offset = Angle(degrees: newValue)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waveHeight = 0.04 * rect.height
        let yOffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        path.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: x, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}

struct CorrectMark: Shape {
    func path(in rect: CGRect) -> Path  {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX - 13, y: rect.midY + 5))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + 20))
        path.addLine(to: CGPoint(x: rect.midX + 30, y: rect.midY - 5))
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
