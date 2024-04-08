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
    @State private var isShared = false
    @State private var sparkID: String = ""
    var userID: String = "UserUniqueIdentifier"
    var qrCodeImage: UIImage {
        let urlString = "https://example.com/user/\(userID)"
        return generateDarkModeQRCode(from: urlString)
    }

    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                VStack(spacing: 5){
                    HStack {
                        Text("spark.sampleurl.123456789")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 60)
                        Spacer()
                        
                        ZStack {
                            VStack {
                                Button(action: {
                                    withAnimation {
                                        self.isShared.toggle()
                                    }
                                }) {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }.padding(.horizontal, 16)
                VStack(spacing:5){
                    HStack {
                        Text("Spark-ID: 123456789")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 60)
                        
                        Spacer()
                        
                        ZStack {
                            VStack {
                                Button(action: {
                                    withAnimation {
                                        self.isShared.toggle()
                                    }
                                }) {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }.padding(.horizontal, 16)
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .cornerRadius(50)
                    .padding(.horizontal, 16)
                
                Text("Add Friend:")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                TextField("Spark-ID", text: $sparkID)
                    .padding(.horizontal, 32)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(50)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32) 

                Button(action: {}) {
                    Text("Continue")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.black)
                }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(.white)
                        .cornerRadius(25)
                        .padding(.top, 25)
                        .padding(.horizontal, 32)
            }
            .padding(.horizontal, 32)
        }
    }
}

struct AddFriends_Previews: PreviewProvider {
    static var previews: some View {
        AddFriends()
    }
}
