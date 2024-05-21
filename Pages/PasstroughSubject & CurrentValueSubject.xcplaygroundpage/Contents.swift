//: [Previous](@previous)

import Foundation
import Combine

// MARK: PassthroughSubject
//struct Weather {
//    let weatherPublisher = PassthroughSubject<Int, Error>()
//    
//    func getWeatherInfo() {
//        weatherPublisher.send(36)
////        weatherPublisher.send(completion: .finished)
//        weatherPublisher.send(completion: .failure(URLError(.badURL)))
//        weatherPublisher.send(33)
//    }
//}
//
//let weather = Weather()
//weather.weatherPublisher.sink { completion in
//    switch completion {
//    case .finished:
//        print("Finished")
//    case .failure(let error):
//        print("Error: \(error.localizedDescription)")
//    }
//} receiveValue: { value in
//    print("Values: \(value)")
//}
//
//weather.getWeatherInfo()


// MARK: CurrentValueSubject
struct BotApp {
    var onboardingPublisher = CurrentValueSubject<String, Error>("Welcome to the app") // Default value
    
    func startOnboarding() {
        onboardingPublisher.send("Start a conversation with a contact")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onboardingPublisher.send("Send a sticker")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            onboardingPublisher.send("Activate notifications")
        }
    }
}
let botApp = BotApp()
let cancellable = botApp.onboardingPublisher.sink { completion in
    switch completion {
    case .finished:
        print("Finished")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
// MARK: Good for debug publisher
//    let cancellable = botApp.onboardingPublisher.handleEvents(receiveSubscription: { subscription in
//        print("1 => Subscription Received \(subscription)")
//    }, receiveOutput: { value in
//        print("2 => Value Received \(value)")
//    }, receiveCompletion: { completion in
//        print("3 => Completion Received \(completion)")
//    }, receiveCancel: {
//        print("4 => Cancel Received")
//    }, receiveRequest: { request in
//        print("5 => Request Received \(request)")
//    })
    
} receiveValue: { value in
    print("Values: \(value)")
}

botApp.startOnboarding()

//: [Next](@next)
