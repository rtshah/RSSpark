import SwiftUI

struct AddFrPopUp: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Keep in mind —")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text("your friends can see what you're up to, this is for that group chat and those friends.")
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Button(action: {
                }) {
                    Text("Accept")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(5)
                }
                .offset(y:10)
            }
            .frame(width: 325, height: 300)
            .background(Color.white)
            .cornerRadius(25)
        }
    }
}

struct AddFrPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddFrPopUp()
    }
}
