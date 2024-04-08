import SwiftUI

struct SnapAvatar1: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Sign up with your Snapchat account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.vertical, 70)
                
                Button(action: {
                }) {
                    HStack {
                        Image("snapchatIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                        Text("Continue with Snapchat")
                            .foregroundColor(.black)
                    }
                    .padding()
                    
                    .background(Color.yellow)
                    .cornerRadius(15)
                }
                Spacer()

            }
            
            
            // VStack for "I don't have Snapchat" text at the bottom
            VStack {
                Spacer() // This Spacer will push the text to the bottom
                Text("I don't have Snapchat")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.bottom) // Add some padding at the bottom if needed
            }
        }
    }
}

struct SnapAvatar1_Previews: PreviewProvider {
    static var previews: some View {
        SnapAvatar1()
    }
}
