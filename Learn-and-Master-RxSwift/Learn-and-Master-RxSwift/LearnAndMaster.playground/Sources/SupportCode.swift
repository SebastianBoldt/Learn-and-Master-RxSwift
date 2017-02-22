import Foundation

public func exampleOf(description: String, action: () -> ()) {
    print("----Example of:",description,"----")
    action()
}
