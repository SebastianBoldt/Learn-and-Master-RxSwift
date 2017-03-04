//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

enum RxError: Error {
    case Test
}

Observable<Int>.error(RxError.Test).subscribe({
    print($0)
})









