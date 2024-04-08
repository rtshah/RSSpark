import SwiftUI

struct SnapAvatar3: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack() {
                Text("Default Avatar")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.vertical, 32)
                
                Button(action: {
                }) {
                    HStack {
                        Image("snapchatIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                        Text("Create your avatar")
                            .foregroundColor(.black)
                    }
                    .padding()
                    
                    .background(Color.yellow)
                    .cornerRadius(15)
                }
                Spacer()
                
            }
            
            
            VStack(spacing: 32) {
                
                Spacer() // This Spacer will push the text to the bottom
                
                Button(action: {}) {
                    Text("Continue")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(.white)
                .cornerRadius(25)
                .padding(.top, 25)
                .padding(.horizontal, 64)
                
                Text("Login with Snapchat")
                    .underline()
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
        }
    }
}

struct SnapAvatar3_Previews: PreviewProvider {
    static var previews: some View {
        SnapAvatar3()
    }
}
