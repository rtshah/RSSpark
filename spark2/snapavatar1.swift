import SwiftUI

struct SnapAvatar1: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Main content VStack
            VStack(spacing: 120) {
                Text("Sign up with your Snapchat account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .offset(y:100)
                
                Button(action: {
                    // Dummy snap button action
                }) {
                    HStack {
                        // Ensure you have an image named "snapchatIcon" in your assets
                        Image("snapchatIcon") // Replace with your actual image name
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
                .offset(y:100)

                
                Spacer() // This Spacer will push the button and title to the top and "I don't have Snapchat" to the bottom
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
