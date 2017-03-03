//: [Previous](@previous)

import Foundation
import RxSwift

// To Transform Elements emitted from a observable sequence you use the map operator 

// Map
let intSequence = Observable<Int>.of(1,2,3,4,5,6,7,8,9,10)
intSequence.map { $0 * $0 }.subscribe(onNext:{
    print($0)
}).dispose()

struct Person {
    let name : Variable<String> = Variable<String>("No Name")
}

let p = Person()
let pVar = Variable(p)
pVar.asObservable().flatMap { return $0.name.asObservable() }.subscribe{
    print($0)
}.dispose()


// Flatmap
let sequence1  = Observable<Int>.of(1,3,5,7,9)
let sequence2  = Observable<Int>.of(2,4,6,8)
let sequenceOfSequences = Observable.of(sequence1,sequence2)

sequenceOfSequences.flatMap{ return $0 }.subscribe {
    print($0)
}


let sequence3 = Observable.of(1,2,3,4,5)
sequence3.scan(0) { seed, value in
    return seed + value
}.subscribe(onNext:{
      print($0)
})

Observable.of(1,2,3,4,5,6,7,8,9).buffer(timeSpan: 1, count: 3, scheduler: MainScheduler()).subscribe(onNext:{
    print($0)
})

//: [Next](@next)
