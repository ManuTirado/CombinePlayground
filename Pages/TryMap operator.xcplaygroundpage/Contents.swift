//: [Previous](@previous)

import Foundation
import Combine

// MARK: TryMap int from publisher to string

enum SwiftError: Error {
    case errorStringToInt
}

func mapStringToInt(with stringValue: String) throws -> Int {
    guard let result = Int(stringValue) else {
        throw SwiftError.errorStringToInt
    }
    return result
}

let stringPublisher = PassthroughSubject<String, SwiftError>()

stringPublisher
    .tryMap({ value in
        try mapStringToInt(with: value)
    })
    .sink { completion in
        print("Completion: \(completion)")
    } receiveValue: { value in
        print("Value: \(value)")
    }

stringPublisher.send("91")
stringPublisher.send("No Number") // Forces error & stop receiving values
stringPublisher.send("23")

//: [Next](@next)
