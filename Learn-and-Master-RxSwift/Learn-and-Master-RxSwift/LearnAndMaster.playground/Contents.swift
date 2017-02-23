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

/// PublishSubjects

exampleOf(description: "PublishSubject") {
    
    // Just emits new elements 
    // so elements before the subscription will no be emitted
    let subject = PublishSubject<String>()
    
    subject.subscribe {
        print($0)
    }
    
    subject.onNext("Hello World")
    subject.onNext("Another String")
    // subject.onCompleted()
    subject.onNext("Will not be printed")
    
    // The new subscription will just get new events not the old ones
    let newSubscription = subject.subscribe(onNext:{
        print("New Sub")
        print($0)
    })
    
    subject.onNext("Hello")
    newSubscription.dispose()
    
    subject.onNext("Print")
}

// You just want to get most recent element
exampleOf(description: "BehaviourSubject") {
    
    let behaviourSubject = BehaviorSubject(value: "a")
    
    let first = behaviourSubject.subscribe {
        print($0)
    }
    
    behaviourSubject.onNext("b")
    
    let newSubscription = behaviourSubject.subscribe {
        print("new",$0)
    }
}

exampleOf(description: "ReplaySubject", action: {
    let subject = ReplaySubject<Int>.create(bufferSize: 3)
    subject.onNext(1)
    subject.onNext(2)
    subject.onNext(3)
    subject.onNext(4)
    
    subject.subscribe {
        print($0)
    }
})

// Variable is a wrapper for a behaviour object
exampleOf(description: "Variable", action: {
    let variable = Variable("A")
    variable.asObservable().subscribe(onNext:{
        print($0)
    })
    
    variable.value = "B"
    
    variable.asObservable().subscribe({
        print("new",$0)
    })
    
})








