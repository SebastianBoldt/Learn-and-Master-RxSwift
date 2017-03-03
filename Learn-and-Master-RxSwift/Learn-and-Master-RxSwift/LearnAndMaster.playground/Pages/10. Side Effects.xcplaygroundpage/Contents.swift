//: [Previous](@previous)

import Foundation
import RxSwift


Observable.of(1,2,3,4,5).do(onNext: {
    $0 * 10 // This will have no effect
}).subscribe(onNext:{
    print($0)
})
//: [Next](@next)
