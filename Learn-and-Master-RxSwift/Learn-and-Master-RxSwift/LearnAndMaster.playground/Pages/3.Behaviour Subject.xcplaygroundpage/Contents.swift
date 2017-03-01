//: [Previous](@previous)

import Foundation
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

// Add you subscription to a bag so it will automatically destroyed on deinit
let bag = DisposeBag()

// Lets create a BeviourSubject
// A behaviour Subject needs a start value
var behaviourSubject = BehaviorSubject<String>(value:"Just Sub 1")
behaviourSubject.subscribe
// This subscription will receive the Start Event
let subscription1 = behaviourSubject.subscribe {
    print(#line,$0)
}.addDisposableTo(bag)

behaviourSubject.onNext("Also just Sub 1")

// The most recent event will be world so line 24 will also print "World"
behaviourSubject.onNext("Sub 1 & Sub 2")

let subscription2 = behaviourSubject.subscribe{
    print(#line,$0)
}.addDisposableTo(bag)

let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
let subOnOtherThread = behaviourSubject.observeOn(concurrentScheduler).subscribe {
    print("Hello World")
    print(Thread.current)
}

// This will emit to both subscriptions
behaviourSubject.onNext("Sub 1 & Sub 2 again")

// Subscription 3 will start with this event because it is the most recent
behaviourSubject.onNext("Sub 1 & Sub 2 & Sub 3")

let subscription3 = behaviourSubject.subscribe {
    print(#line,$0)
}.addDisposableTo(bag)

behaviourSubject.onNext("Everyone will receive this one")

//: [Next](@next)
