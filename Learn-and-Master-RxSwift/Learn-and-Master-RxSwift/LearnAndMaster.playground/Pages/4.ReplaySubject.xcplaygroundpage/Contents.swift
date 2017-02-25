//: [Previous](@previous)

import Foundation
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

// Add you subscription to a bag so it will automatically destroyed on deinit
let bag = DisposeBag()

// Lets create a BeviourSubject
// A replay Subject with a cache size of 3, so it will replay the last 2 events to each subscriber
var replaySubject = ReplaySubject<String>.create(bufferSize: 2)

let sub1 = replaySubject.subscribe {
    print(#line,$0)
}.addDisposableTo(bag)

replaySubject.onNext("Will be received by subscription 1 but not by subscription 2")
replaySubject.onNext("Will be received by subscription 1 and 2")
replaySubject.onNext("Will also be received by subscription 1 and 2")

let sub2 = replaySubject.subscribe {
    print(#line,$0)
}.addDisposableTo(bag)


//: [Next](@next)
