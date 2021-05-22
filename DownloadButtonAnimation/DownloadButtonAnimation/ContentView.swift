//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DownloadButton()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DownloadButton: View {

    @State private var left: CGPoint = CGPoint(x: 20, y: 70)
    @State private var right: CGPoint = CGPoint(x: 80, y: 70)
    @State private var height: CGFloat = 0
    @State private var rotation: Double = 0
    @State private var offset: (CGFloat, CGFloat) = (0, 0)
    @State private var color = Color.blue
    @State private var downloading = false

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                Circle()
                    .stroke(Color.blue, lineWidth: 5)
                    .frame(width: 150, height: 150)
                FillCircle(endAngle: rotation)
                    .frame(width: 140, height: 140)
                    .foregroundColor(.blue)
                Arrow(left: left, right: right, height: height)
                    .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: offset.1)
                    .rotationEffect(.degrees(rotation))
            }
            .onTapGesture {
                if !self.downloading {
                    self.downloading = true
                    withAnimation(Animation.linear(duration: 0.3)) {
                        self.left = CGPoint(x: 50, y: 100)
                        self.right = CGPoint(x: 50, y: 100)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                            self.height = 28
                            self.offset.1 = -50
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(Animation.easeInOut(duration: 1)) {
                            self.rotation = 360
                            self.height = 100
                            self.color = Color.white
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                        withAnimation(Animation.linear(duration: 0.2)) {
                            self.offset.1 += 17.5
                        }
                        withAnimation(Animation.easeInOut(duration: 0.3).delay(0.2)) {
                            self.offset.0 = -10
                            self.left = CGPoint(x: 35, y: 85)
                            self.right = CGPoint(x: 80, y: 65)
                        }
                        self.downloading = false
                    }
                }
            }
        }
    }
}

struct DownloadButton_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButton()
    }
}
