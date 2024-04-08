import SwiftUI
import CoreImage.CIFilterBuiltins

func generateDarkModeQRCode(from string: String) -> UIImage {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    filter.message = Data(string.utf8)
    
    if let qrCodeImage = filter.outputImage,
       let invertedImage = qrCodeImage.inverted(),
       let cgImage = context.createCGImage(invertedImage, from: invertedImage.extent) {
        return UIImage(cgImage: cgImage)
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}

extension CIImage {
    func inverted() -> CIImage? {
        guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        return filter.outputImage
    }
}

struct AddFriends: View {
    @State private var sparkID: String = ""
    var userID: String = "UserUniqueIdentifier"
    var qrCodeImage: UIImage {
        let urlString = "https://example.com/user/\(userID)"
        return generateDarkModeQRCode(from: urlString)
    }

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 284, height: 57)
                .foregroundColor(Color.white)
                .cornerRadius(50)
                .offset(x: 0, y: -408.50)

            Text("copy")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .underline()
                .offset(x: 0, y: -353.50)

            Rectangle()
                .frame(width: 284, height: 57)
                .foregroundColor(Color.white)
                .cornerRadius(50)
                .offset(x: 0, y: -293.50)

            Text("copy")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .underline()
                .offset(x: 0, y: -248.50)

            Image(uiImage: qrCodeImage)
                .resizable()
                .interpolation(.none) // Prevent blurring
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(50)

            Text("Add Friend:")
                .font(.system(size: 20, weight: .bold)) // Default font in bold
                .foregroundColor(.white) // Adjust for dark mode
                .offset(x: 0.50, y: 119.50)

            TextField("Spark-ID", text: $sparkID)
                .padding()
                .frame(width: 284, height: 57)
                .background(Color.white) // Light grey for visibility in dark mode
                .cornerRadius(50)
                .offset(x: 0, y: 174.50)
                .foregroundColor(.black) // Text color changed to white for dark mode

            Button(action: {
                // Action for the Submit button
            }) {
                Text("Submit")
                    .font(.system(size: 20, weight: .bold)) // Default font in bold
                    .foregroundColor(.black) // Keep black for contrast
            }
            .frame(width: 142, height: 45)
            .background(Color.yellow.opacity(0.43)) // Keep or adjust for visibility in dark mode
            .cornerRadius(50)
            .offset(x: 0, y: 252.50)

            Rectangle()
                .foregroundColor(Color.black) // Adjust for dark mode
                .frame(width: 90, height: 15)
                .cornerRadius(50)
                .offset(x: 8, y: 435.14)
                .rotationEffect(.degrees(45))

            Rectangle()
                .foregroundColor(Color.black)
                .frame(width: 90, height: 15)
                .cornerRadius(50)
                .offset(x: 73.64, y: 445.75)
                .rotationEffect(.degrees(135))

            Button(action: {
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(Color.red.opacity(0.44))
                        .frame(width: 30, height: 30)
                    Text("x")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .offset(x: 0, y: -2)
                }
            }
            .offset(x: -140, y: -495)
        }
        .offset(y: 100)
        .frame(width: 430, height: 932)
        .background(.black)
    }
}

struct AddFriends_Previews: PreviewProvider {
    static var previews: some View {
        AddFriends()
    }
}
