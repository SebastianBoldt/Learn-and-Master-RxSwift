//: [Previous](@previous)

import Foundation
import RxSwift
import PlaygroundSupport

print("Start")
PlaygroundPage.current.needsIndefiniteExecution

// Add you subscription to a bag so it will automatically destroyed on deinit
let bag = DisposeBag()

// Lets create a Publishsubject
var publishSubject = PublishSubject<String>()

// This will not affect the Subscription
publishSubject.onNext("Hello")
publishSubject.onNext("World")

let subscription1 = publishSubject.subscribe(onNext:{
    print(#line,$0)
})

subscription1.addDisposableTo(bag)

// This will emit to subscription1
publishSubject.onNext("Hello")
publishSubject.onNext("Again")

let subscription2 = publishSubject.subscribe(onNext:{
    print(#line,$0)
})

publishSubject.onNext("Both will receive")

//Dispose subscription 1 so just subscription 2 will receive the elements
subscription1.dispose()

publishSubject.onNext("Subscription2 will receive")
//: [Next](@next)

let observable = Observable.just("Hello World")
let subscription = observable.subscribe {
    print($0)
}
subscription.dispose()
