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
//: [Next](@next)
