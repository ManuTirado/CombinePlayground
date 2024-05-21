import UIKit
import Combine

let myArray = ["1", "2", "3", "4"]

// MARK: Create publishers
let myPublisher = myArray.publisher
let just = Just(1233)


// MARK: Create subscribers
myPublisher.sink { isFinished in
    print("isFinished: \(isFinished)")
} receiveValue: { value in
    print("Value received: \(value)")
}

class YoutubeChannel {
    var numberOfSuscribers: Int = 0
}
let channel = YoutubeChannel()
just.assign(to: \YoutubeChannel.numberOfSuscribers, on: channel)
print("numberOfSuscribers: \(channel.numberOfSuscribers)")
