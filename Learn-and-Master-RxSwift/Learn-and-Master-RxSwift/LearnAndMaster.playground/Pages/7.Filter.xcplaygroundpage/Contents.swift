//: [Previous](@previous)

import Foundation
import RxSwift

let bag = DisposeBag()

// Filter
Observable.of(2,30,22,5,60,1).filter{$0 > 10}.subscribe(onNext:{
    print($0)
}).addDisposableTo(bag)

// DistinctUntilChanged
Observable.of(1,2,2,1,3).distinctUntilChanged().subscribe(onNext:{
    print($0)
})


//: [Next](@next)
