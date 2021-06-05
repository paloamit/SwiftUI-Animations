//

import SwiftUI

struct ContentView: View {
    private let backgroundColor = Color(red: 224.0/255.0, green: 155.0/255.0, blue: 170.0/255.0)
    private let eyeSize: CGFloat = 120

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Eyes(size: eyeSize)
            }
        }
    }
}

struct Eyes: View {
    @State var size: CGFloat

    var body: some View {
        HStack {
            Eye(size: size)
                .offset(x: -size/10)
            Eye(size: size)
                .offset(x: size/10)
        }
    }
}

struct Eye: View {
    private let foregroundColor = Color(red: 227.0/255.0, green: 176.0/255.0, blue: 178.0/255.0)
    @State var size: CGFloat
    @State private var animate = false

    var body: some View {
        ZStack {
            Circle()
                .frame(width: size)
                .foregroundColor(foregroundColor)
                .offset(x: size/15)
            Circle()
                .frame(width: size)
                .foregroundColor(.white)
            Circle()
                .frame(width: size/3)
                .foregroundColor(.black)
                .offset(x: size/4)
                .rotation3DEffect(.degrees(animate ? -360 : 0),
                                  axis: (x: 0, y: 0, z: 1))
                .animation(Animation.easeOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false))
        }.onAppear() {
            animate.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
