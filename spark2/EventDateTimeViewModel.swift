import SwiftUI

class EventDateTimeViewModel: ObservableObject {
    @Published var startTime: Date = Date()
    @Published var isShowingSetTimeView: Bool = false
    @Published var timeHasBeenSet: Bool = false // Add this line
}
