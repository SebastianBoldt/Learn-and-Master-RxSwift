# Learn and Master RxSwift
This is curated workspace to learn the RxSwift. It contains Playgrounds which helps you with understanding the Basics of RxSwift.
This is accompanying material for this post on Medium: 
[CLICK HERE](https://medium.com/@sebastianbo/learn-and-master-%EF%B8%8F-the-basics-of-rxswift-in-10-minutes-818ea6e0a05b#.chlo1248g)

The first thing you need to understand is that everything in RxSwift is an observable sequence or something that operates on or subscribes to events emitted by an observable sequence. Arrays, Strings or Dictionaries will be converted to observable sequences in RxSwift. You can create an own observable sequence of an Instance of any type that conforms to the to the Sequence Protocol from the Swift Standard Library.

You subscribe to observable sequences by calling 
subscribe(on:(Event<T>)-> ()). 
The passed block will receive all events emitted by that sequence.

Observable sequences can emit zero or more events over their lifetimes. 
In RxSwift an Event is just an Enumeration Type with 3 possible states:
* .next(value: T) — When a value or collection of values is added to an observable sequence it will send the next event to its subscribers as seen above. The associated value will contain the actual value from the sequence.
* .error(error: Error) — If an Error is encountered, a sequence will emit an error event. This will also terminate the sequence.
* .completed — If a sequence ends normally it sends a completed event to its subscribers

If you want to cancel a description you can do that by calling dispose on it. You can also add the subscription to a Disposebag which will cancel the description for you automatically on deinit of the DisposeBag Instance. Another thing you can do is to subscribe just to a specific Event. For Example, if just want to receive the error events emitted by a sequence, you can use: subscribe(onError:(Error->())).

# Lifecycle of an observable sequence

* An observable sequence can emit zero or more events over its lifetime 
* When a value or collection of values is added to it will send a next event
* If an error is encountered, a sequence can emit an error event, this will also terminate the sequence
* If a sequence ends normally it sends a completed event
* If you want to cancel a description of a sequence you can do that by calling dispose on it
* You can also add the subscription to a disposebag which will cancel the description for you automatically on deinit

# Subjects 

A Subject is a special form of an Observable Sequence, you can subscribe and dynamically add elements to it. There are currently 4 different kinds of Subjects in RxSwift

* PublishSubject - If you subscribe to it you will get all the events that will happen after you subscribed.
* BehaviourSubject - A behavior subject will give any subscriber the most recent element and everything that is emitted by that sequence after the subscription happened.
* ReplaySubject - If you want to replay more than the most recent element to new subscribers on the initial subscription you need to use a ReplaySubject. With a ReplaySubsject, you can define how many recent items you want to emit to new subscribers.
* Variable - A Variable is just a BehaviourSubject wrapper that feels more natural to a none reactive programmers. It can be used like a normal Variable.

# Transformation

Sometimes you want to transform, combine or filter the elements emitted by an observable sequence before the subscriber receives them. 

* Map - To transform Elements emitted from an observable Sequence, before they reach their subscribers, you use the map operator. Imagine a transformation that multiplies each value of a sequence with 10 before emitting.
* Scan - Scan starts with an initial seed value and is used to aggregate values just like reduce in Swift.
* Buffer - The Buffer operator transforms an Observable that emits items into an Observable that emits buffered collections of those items.

... to be continued 

# Filter

If you only want to react on next events based on certain criteria you should use a filter operator.

* Filter - The Basic filter Operation works similar to the swift equivalent. You just define a condition that needs to be passed and if the condition is fulfilled a .next event will be emitted to its subscribers.
* DistinctUntilChanged - If you just want to emit next Events if the value changed from previous ones you need to use distinctUntilChanged.

... to be continued 

# Combine 

Combining sequences is a common Task. RxSwift provides a lot of operators for you. Here are 3 of them:

* StartWith - If you want an Observable to emit a specific sequence of items before it begins emitting the items normally expected from it, use the startWith operator.
* Merge - You can combine the output of multiple Observables so that they act like a single Observable, by using the Merge operator.
* Zip - You use the Zip method if you want to merge items emitted by different observable sequences to one observable sequence. Zip will operate in strict sequence, so the first two elements emitted by Zip will be the first element of the first sequence and the first element of the second sequence combined. Keep also in Mind that Zip will only emit as many items as the number of items emitted of the source Observables that emits the fewest items.

# Side Effects 

If you want to register callbacks that will be executed when certain events take place on an Observable Sequence you need to use the doOn Operator. It will not modify the emitted elements but rather just pass them through. 
You can use … 

* do(onNext:) -  if you want to do something just if a next event happened


* do(onError:) - if errors will be emitted and 


* do(onCompleted:) -  if the sequence finished successfully.

# Schedulers 

Operators will work on the same thread as where the subscription is created. In RxSwift you use schedulers to force operators do their work on a specific queue. You can also force that the subscription should happen on a specifc Queue. You use subscribeOn and observerOn for those tasks. If you are familiar with the concept of operation-queues or dispatch-queues this should be nothing special for you. A scheduler can be serial or concurrent similar to GCD or OperationQueue. There are 5 Types of Schedulers in RxSwift:

* MainScheduler — “Abstracts work that needs to be performed on MainThread. In case schedule methods are called from the main thread, it will perform the action immediately without scheduling.This scheduler is usually used to perform UI work.”
* CurrentThreadScheduler — “Schedules units of work on the current thread. This is the default scheduler for operators that generate elements.”
* SerialDispatchQueueScheduler — “Abstracts the work that needs to be performed on a specific dispatch_queue_t. It will make sure that even if a concurrent dispatch queue is passed, it's transformed into a serial one.Serial schedulers enable certain optimizations for observeOn.The main scheduler is an instance of SerialDispatchQueueScheduler"
* ConcurrentDispatchQueueScheduler — “Abstracts the work that needs to be performed on a specific dispatch_queue_t. You can also pass a serial dispatch queue, it shouldn't cause any problems. This scheduler is suitable when some work needs to be performed in the background.”
* OperationQueueScheduler — “Abstracts the work that needs to be performed on a specific NSOperationQueue. This scheduler is suitable for cases when there is some bigger chunk of work that needs to be performed in the background and you want to fine tune concurrent processing using maxConcurrentOperationCount.”

# Marble Diagrams

* Marble Diagrams are interactive Diagrams that show you how rx operators transform observable sequences 

Web-App: http://rxmarbles.com

iOS-App: https://itunes.apple.com/com/app/rxmarbles/id1087272442?mt=8

Android: https://play.google.com/store/apps/details?id=com.moonfleet.rxmarbles
