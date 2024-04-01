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
                        .offset(y: 125)

                    Group {
                        TextField("Name", text: $name)
                            .autocapitalization(.none)
                            .padding(20)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(10)
                            .frame(width: 237.1875)
                            .offset(y: 125)
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .padding(20)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(10)
                            .frame(width: 237.1875)
                            .offset(y: 125)

                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .padding(20)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(10)
                            .frame(width: 237.1875)
                            .offset(y: 125)

                        SecureField("Confirm Password", text: $confirmPassword)
                            .autocapitalization(.none)
                            .padding(20)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(10)
                            .frame(width: 237.1875)
                            .offset(y: 125)
                    }

                    Button(action: {
                        if allFieldsAreValid() {
                            self.shouldNavigate = true
                        }
                    }) {
                        Text("Confirm")
                            .navigationTitle("")
                            .foregroundColor(.black)
                            .frame(width: 180, height: 60)
                            .background(Color.white)
                            .cornerRadius(45)
                    }
                    .offset(y: 130)
                    Spacer()

                    Button(action: {
                        print("Navigate to login screen")
                    }) {
                        Text("Already have an account?")
                            .font(.system(size: 17))
                            .underline()
                            .foregroundColor(.white)                    }
                    .offset(y: -120)
                }
                .offset(y:-50)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
            }
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
