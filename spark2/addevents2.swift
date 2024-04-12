import SwiftUI

extension DateFormatter {
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
}

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
    @ObservedObject var viewModel = EventDateTimeViewModel()

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
                    .background(Color.gray)
                    .cornerRadius(15)
                    .foregroundColor(.white)

                TextField("Theme, description, etc!", text: $eventDescription)
                    .padding(32)
                    .background(Color.gray)
                    .cornerRadius(15)
                    .foregroundColor(.white)

                TextField("Location", text: $location)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                    .foregroundColor(.white)

                HStack{
                    Spacer()
                    if viewModel.timeHasBeenSet {
                        VStack {
                            Text("Starts at \(viewModel.startTime, formatter: DateFormatter.timeFormatter)")
                                .foregroundColor(.white)
                            Button("Change") {
                                viewModel.isShowingSetTimeView = true
                            }
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                        }
                    } else {
                        Button("Set Time") {
                            viewModel.isShowingSetTimeView = true
                        }
                        .foregroundColor(.black)
                        .bold()
                        .frame(width: 150, height: 50)
                        .background(Color.white)
                        .cornerRadius(30)
                        Spacer()
                    }
                }

                Text("Who's coming?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {
                        selection = "Everyone"
                        everyoneText = "Let's Rage 🎉"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            everyoneText = "Everyone"
                        }
                    }) {
                        HStack {
                            Image(systemName: selection == "Everyone" ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(.white)
                            Text(everyoneText)
                                .font(.system(size: 17))

                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)

                    Button(action: {
                        selection = "Friends and Mutuals Only"
                        friendsAndMutualsText = "Kickback 🤗"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            friendsAndMutualsText = "Friends and Mutuals Only"
                        }
                    }) {
                        HStack {
                            Image(systemName: selection == "Friends and Mutuals Only" ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(.white)
                            Text(friendsAndMutualsText)
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)

                    Button(action: {
                        selection = "Friends Only"
                        friendsOnlyText = "Small hangout 😄"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            friendsOnlyText = "Friends Only"
                        }
                    }) {
                        HStack {
                            Image(systemName: selection == "Friends Only" ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(.white)
                            Text(friendsOnlyText)
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)

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
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.isShowingSetTimeView) {
            SetTime(viewModel: viewModel)
        }
    }
}

struct AddEvents2_Previews: PreviewProvider {
    static var previews: some View {
        AddEvents2()
    }
}
