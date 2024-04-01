import SwiftUI

struct SnapAvatar1: View {
    var body: some View {
        ZStack() {
            Color.black
            VStack(spacing: 60) {
            Text("Sign up with your Snapchat account")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                // dummy snap button
            }) {
                HStack {
                    Image("insertsnapiconhere")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                    Text("Log in with Snapchat")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.yellow)
                .cornerRadius(15)
            }
            }
        }
    }
}

struct SnapAvatar1_Previews: PreviewProvider {
    static var previews: some View {
        SnapAvatar1()
    }
}
