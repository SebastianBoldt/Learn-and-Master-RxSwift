//: [Previous](@previous)

import Foundation
import RxSwift

// To Transform Elements emitted from a observable sequence you use the map operator 

let stringSequence = Observable<Int>.of(1,2,3,4,5,6,7,8,9,10)

stringSequence.map { $0 * $0 }
stringSequence.scan(0, accumulator: { last, current in return last + current }).subscribe {
    print($0)
}


//: [Next](@next)
