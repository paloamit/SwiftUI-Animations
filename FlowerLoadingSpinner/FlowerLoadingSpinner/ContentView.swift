//

import SwiftUI

struct ContentView: View {
    let gradientStartColor = Color(red: 68.0/255.0, green: 60.0/255.0, blue: 174.0/255.0)
    let gradientEndColor = Color(red: 162.0/255.0, green: 100.0/255.0, blue: 200.0/255.0)
    let flowerOffset: CGFloat = 75.0
    let flowerRadius: CGFloat = 140.0
    @State var count = 0
    @State var rotationAngleArray: [Double] = [0, 45, 0, -45]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Flower(offset: flowerOffset, radius: flowerRadius)
                Flower(offset: flowerOffset, radius: flowerRadius)
                    .rotationEffect(.degrees(rotationAngleArray[count]))
                    .animation(Animation.interpolatingSpring(mass: 1,
                                                             stiffness: 300,
                                                             damping: 15,
                                                             initialVelocity: 4))
            }.frame(width: geometry.size.width, height: geometry.size.height)
            .background(LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientEndColor]),
                                        startPoint: .topLeading,
                                        endPoint: .trailing))
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    count = (count >= rotationAngleArray.count-1) ? 0 : (count + 1)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
