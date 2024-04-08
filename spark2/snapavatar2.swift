import SwiftUI

struct SnapAvatar2: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Your bitmoji is your in app avatar")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.horizontal, 32)

                    Spacer()
                    Button(action: {}) {
                        Text("Continue")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.black)
                    }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(.white)
                            .cornerRadius(40)
                            .padding(.top, 25)
                            .padding(.horizontal, 32)
                            .offset(y:-20)
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
