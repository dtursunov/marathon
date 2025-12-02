import Foundation

public struct A {
    public let value: Int
}

public struct B {
    public let value: String
}

public struct LoggerA {
    public func log(with a: A) {
        print(a.value)
    }
}
public struct LoggerB {
    public func log(with b: B) {
        print(b.value)
    }
}
