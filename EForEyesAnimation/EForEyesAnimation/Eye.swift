//

import SwiftUI

struct Eye: View {
    @State var width: CGFloat
    @Binding var height: CGFloat

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Ellipse()
                .foregroundColor(.white)
                .frame(width: width, height: height)
            Circle()
                .foregroundColor(.black)
                .frame(width: height/2)
        }.frame(width: width, height: height)
    }
}

struct Eye_Previews: PreviewProvider {
    static var previews: some View {
        Eye(width: 200, height: Binding<CGFloat>.constant(100))
    }
}
