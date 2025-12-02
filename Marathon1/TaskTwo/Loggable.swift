protocol Loggable {
    associatedtype Parametr
    
    func log(_ parametr: Parametr)
}

extension LoggerA: Loggable {
    typealias Parametr = A

    func log(_ parametr: A) {
        log(with: parametr)
    }
}

extension LoggerB: Loggable {
    typealias Parametr = B
    
    func log(_ parametr: B) {
        log(with: parametr)
    }
}
