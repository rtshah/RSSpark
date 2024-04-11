//README - this is a button meant to overlay the addevent screen

import SwiftUI

struct SetTime: View {
    @ObservedObject var viewModel: EventDateTimeViewModel
    @State private var endDate: Date = Date().addingTimeInterval(3 * 3600)
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 390, height: 450)
                    .border(Color.white, width: 1)
                    .cornerRadius(50)
                //THE RECTANGLE HAS A ROUNDED RADIUS
                //REMOVE THE BORDER WHEN ADDING THE COMPONENT, JUST TO PREVIEW IT
                    .overlay(
                        VStack(spacing: 25) {
                            Text("Set Time")
                                .font(.system(size: 22))
                            DatePicker(
                                "Start:",
                                selection: $viewModel.startTime,
                                in: Date()...,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .datePickerStyle(DefaultDatePickerStyle())
                            .padding()
                            
                            DatePicker(
                                "End:",
                                selection: $endDate,
                                in: viewModel.startTime...,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .datePickerStyle(DefaultDatePickerStyle())
                            .padding()
                            
                            
                            Button(action: {
                                viewModel.timeHasBeenSet = true
                                viewModel.isShowingSetTimeView = false
                            }) {
                                ZStack {
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
                            .padding(.horizontal, 96)
                        }
                    )
                //continue button here
            }
        }
    }
}

struct SetTime_Previews: PreviewProvider {
    static var previews: some View {
        SetTime(viewModel: EventDateTimeViewModel())
    }
}
