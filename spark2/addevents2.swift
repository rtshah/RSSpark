import SwiftUI

struct AddEvents2: View {
    @State private var eventName: String = ""
    @State private var eventDescription: String = ""
    @State private var location: String = ""
    @State private var selection: String?
    @State private var everyoneText: String = "Everyone"
    @State private var friendsAndMutualsText: String = "Friends and Mutuals Only"
    @State private var friendsOnlyText: String = "Friends Only"
    @State private var isShared = false
    @State private var userInput: String = ""
    

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 32.5) {
                HStack {
                    Spacer()
                    Text("Add Event")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding(.top, 16)

                TextField("Event Name", text: $eventName)
                    .padding()
                    .frame(width: 205, height: 38)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 48)
                    .multilineTextAlignment(.leading)

                Text("Your link:")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(.white)

                HStack {
                    Text("spark.sampleurl.123456789")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 60)
                    
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

                Text("Your SparkID:")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(.white)

                Text("samplespa")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 60)
                
                Text("Add a SparkID:")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(.white)

                HStack {
                    TextField("Optional", text: $userInput)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 21, leading: 16, bottom: 21, trailing: 16))
                        .background(.gray)
                        .cornerRadius(20)
                }

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
            }
            .padding(.horizontal, 16)
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct AddEvents2_Previews: PreviewProvider {
    static var previews: some View {
        AddEvents2()
    }
}
