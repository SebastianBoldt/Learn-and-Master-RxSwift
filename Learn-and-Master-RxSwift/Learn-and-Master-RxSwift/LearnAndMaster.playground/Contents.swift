//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

exampleOf(description: "just") {
    
    // Create a simple Observable using just
    let observable = Observable.just("Hello World")
    let bag = DisposeBag()

    // An event is just an enum that can be .next, .error or .completed
    observable.subscribe { (event : Event<String>) in
        switch event {
            case .next(let value):
                print(value)
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
        }
    }.addDisposableTo(bag)
}

exampleOf(description: "of") {
    let bag = DisposeBag()
    let observable = Observable.of(1,2,3,4)
    observable.subscribe { element in
        print(element)
    }.addDisposableTo(bag)
}

exampleOf(description: "subscribeNext") {
    let bag = DisposeBag()
    let observable = Observable.of(1,2,3,4)
    observable.subscribe(onNext:{ next in
        print(next)
    }).addDisposableTo(bag)
}

exampleOf(description: "subscribeCompleted") {
    let bag = DisposeBag()
    let observable = Observable.of(1,2,3,4)
    observable.subscribe(onCompleted:{
        print($0)
    })
}

exampleOf(description: "error") {
    enum RxError: Error {
        case Test
    }
    
    Observable<Int>.error(RxError.Test).subscribe({
        print($0)
    })
}