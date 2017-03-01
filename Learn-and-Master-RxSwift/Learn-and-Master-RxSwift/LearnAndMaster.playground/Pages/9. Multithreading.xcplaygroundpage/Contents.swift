//: [Previous](@previous)

import Foundation
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

let publish1 = PublishSubject<Int>()
let publish2 = PublishSubject<Int>()

let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
Observable.of(publish1,publish2).merge().observeOn(concurrentScheduler).subscribe(onNext:{
    print($0)
})

publish1.onNext(20)
publish1.onNext(40)

//: [Next](@next)
