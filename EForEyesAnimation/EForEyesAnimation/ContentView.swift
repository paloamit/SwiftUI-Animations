//

import SwiftUI

struct ContentView: View {
    private let backgroundColor = Color.black
    private let rectangeWidth: CGFloat = 220.0
    private let rectangeHeight: CGFloat = 30.0
    private let cornerRadius: CGFloat = 25.0
    @State var animateMiddleRectangle = false
    @State var animateEye = false

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: rectangeWidth, height: rectangeHeight)
                .foregroundColor(.white)
                .offset(y: -100.0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: rectangeWidth + 10, height: rectangeHeight)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .offset(x: -95)
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: rectangeWidth, height: rectangeHeight)
                .foregroundColor(.white)
                .offset(y: 100.0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: rectangeWidth - 40,
                       height: animateMiddleRectangle ? rectangeHeight : 0)
                .foregroundColor(.white)
                .offset(x: 20.0)
            Eye(width: rectangeWidth - 40,
                height: animateEye ? Binding<CGFloat>.constant(60) : Binding<CGFloat>.constant(0))
                .offset(x: 20.0)
        }.onAppear() {
            animateMiddleRectangle.toggle()
            Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation(Animation.linear(duration: 0.3)) {
                        animateMiddleRectangle.toggle()
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(Animation.linear(duration: 0.3)) {
                        animateEye.toggle()
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    withAnimation(Animation.linear(duration: 0.3)) {
                        animateMiddleRectangle.toggle()
                    }
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
