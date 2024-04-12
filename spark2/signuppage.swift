import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var shouldNavigate: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 40) {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)

                    Group {
                        HStack {
                            TextField("Name", text: $name)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                                .background(.gray)
                                .cornerRadius(15)
                        }
                        HStack {
                            TextField("Email", text: $email)
                                .foregroundColor(.black)
                                .autocapitalization(.none)
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                                .background(.gray)
                                .cornerRadius(15)
                        }
                        SecureField("Password", text: $password)
                            .foregroundColor(.black)
                            .autocapitalization(.none)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                            .background(.gray)
                            .cornerRadius(15)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .foregroundColor(.black)
                            .autocapitalization(.none)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                            .background(.gray)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal, 16)

                    Button(action: {
                        if allFieldsAreValid() {
                            self.shouldNavigate = true
                        }
                    }) {
                        Text("Continue")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.black)
                            .navigationTitle("")
                            .background(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(.white)
                            .cornerRadius(40)
                            .padding(.top, 25)
                    }
                    .padding(.horizontal, 16)


                    Button(action: {
                        print("Navigate to login screen")
                    }) {
                        Text("Already have an account?")
                            .font(.system(size: 17))
                            .underline()
                            .foregroundColor(.white)
                        .padding(40)                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 120)
            .frame(width: 430, height: 932)
            .background(.black)
        }
    }

    private func allFieldsAreValid() -> Bool {
        // Check if all fields are filled and passwords match
        return !name.isEmpty && !email.isEmpty && !password.isEmpty && password == confirmPassword
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
