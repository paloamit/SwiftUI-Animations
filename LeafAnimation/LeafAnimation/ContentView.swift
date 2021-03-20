//

import SwiftUI

struct ContentView: View {

    @State var shouldAnimate = false
    @State private var degrees = 0.0
    let speed: TimeInterval = 5

    var body: some View {
        ZStack {
            Leaf(size: 150)
                .fill(Color.purple)
                .rotationEffect(.degrees(degrees))
            Leaf(size: 150)
                .fill(Color.orange)
                .rotationEffect(.degrees(degrees + 45))
            Leaf(size: 150)
                .fill(Color.green)
                .rotationEffect(.degrees(degrees + 90))
            Leaf(size: 150)
                .fill(Color.red)
                .rotationEffect(.degrees(degrees + 135))
        }
        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .onAppear() {
            withAnimation(Animation.linear(duration: speed).repeatForever(autoreverses: false)) {
                degrees += 360
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
