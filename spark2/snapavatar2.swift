import SwiftUI

struct SnapAvatar2: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Your Bitmoji will be used to represent you in the app")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()
                    Button("Continue") {
                    }
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                    .frame(width: geometry.size.width * 0.9)
                    .background(Color.yellow)
                    .cornerRadius(15)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                }
            }
        }
    }
}

struct SnapAvatar2_Previews: PreviewProvider {
    static var previews: some View {
        SnapAvatar2()
    }
}
