# Learn-and-Master-RxSwift

> Everything in Rx is an Observable Sequence or a thing that works with a observable sequence.

Rx implements two common patterns:

* Observer
* Iterator


#Lifecycle of an observable sequence

* An observable sequence can emit zero or more events over its lifetime 
* When a value or collection of values is added to it will send a next event
* If an error is encountered, a sequence can emit an error event, this will also terminate the sequence
* If a sequence ends normally it sends a completed event
* If you want to cancel a description of a sequence you can do that by calling dispose on it
* You can also add the subscription to a disposebag which will cancel the description for you automatically on deinit
