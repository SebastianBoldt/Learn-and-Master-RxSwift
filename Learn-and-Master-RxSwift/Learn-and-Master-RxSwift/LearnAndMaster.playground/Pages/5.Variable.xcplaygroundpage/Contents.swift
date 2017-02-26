//: [Previous](@previous)

import Foundation
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

// A variable is just a wrapper for a behaviour subject
// So subscribers will get the most recent value
let variable = Variable("A")
variable.value = "Recent Value"

variable.asObservable().subscribe(onNext:{
    print($0)
})

variable.value = "B"

variable.asObservable().subscribe(onNext:{
    print("new",$0)
})

//: [Next](@next)
