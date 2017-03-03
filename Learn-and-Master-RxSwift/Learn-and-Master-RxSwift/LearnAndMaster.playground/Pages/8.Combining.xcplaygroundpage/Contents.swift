//: [Previous](@previous)

import Foundation
import RxSwift

let bag = DisposeBag()
// Merge 

let publish1 = PublishSubject<Int>()
let publish2 = PublishSubject<Int>()

let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
Observable.of(publish1,publish2).merge().subscribe(onNext:{
    print($0)
})

publish1.onNext(20)
publish1.onNext(40)
publish1.onNext(60)
publish2.onNext(1)
publish1.onNext(80)
publish1.onNext(100)
publish2.onNext(1)

let fetch1 = PublishSubject<Int>()
let fetch2 = PublishSubject<String>()

Observable<(Int,String)>.zip(fetch1, fetch2) { (a, b) throws -> (Int,String) in
    return (a,b)
}.subscribe {
    print($0)
}

fetch1.onNext(1)
fetch1.onNext(2)
fetch2.onNext("Hello")
fetch2.onNext("World")
fetch2.onNext("Again")
fetch1.onNext(3)

Observable.of(3,4,5).startWith(0,1,2).subscribe(onNext:{
    print($0)
})


//: [Next](@next)
