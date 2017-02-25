//: [Previous](@previous)

import Foundation
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

// Create a simple Observable using just
let observable = Observable.of("Hello World!")
let bag = DisposeBag()

// An event is just an enum that can be .next, .error or .completed
let subscription = observable.subscribe { (event : Event<String>) in
    switch event {
    case .next(let value):
        print(value)
    case .error(let error):
        print(error)
    case .completed:
        print("completed")
    }
}.addDisposableTo(bag)

//: [Next](@next)
