import Foundation

struct AwesomeData {
    let id: String
    let awesomeField: Int
    let date: Date
}

extension AwesomeData: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: AwesomeData, rhs: AwesomeData) -> Bool {
        lhs.id == rhs.id
    }
}

extension AwesomeData: Comparable {
    static func < (lhs: AwesomeData, rhs: AwesomeData) -> Bool {
        lhs.date < rhs.date
    }
}
