//: [Previous](@previous)

import Foundation
import Combine

// MARK: Map int from publisher to string

let intPublisher = PassthroughSubject<Int, Never>()

intPublisher
    .map { String($0) }
    .sink { value in
        print("Value: \(value)")
    }

intPublisher.send(18)
intPublisher.send(45)

//: [Next](@next)
