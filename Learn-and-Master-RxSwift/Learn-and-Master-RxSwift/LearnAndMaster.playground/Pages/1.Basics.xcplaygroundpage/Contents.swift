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
// You can subscribe to events using subscribe
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

// You can also subscribe on specific events 
let subscribeJustToErrors = observable.subscribe(onError:{
    // Print just on error case 
    print($0)
})
//: [Next](@next)
