import Foundation

protocol AwesomeService {
    func getAwesomeData(someId: Int, completion: @escaping(Result<[AwesomeData], MyError>) -> Void)
}

final class AwesomeServiceImpl: AwesomeService {
    
    private let api: Api

    
    init(api: Api) {
        self.api = api
    }

    func getAwesomeData(someId: Int, completion: @escaping(Result<[AwesomeData], MyError>) -> Void) {
        api.get(someId) { data, error in
           if let error = error {
               completion(.failure(.error(error)))
           } else if let data = data {
               completion(.success(data))
           } else {
               completion(.failure(.someAnotherError))
           }
        }
    }
}

class Api {
    func get(_ id: Int, completion: @escaping ([AwesomeData]?, Error?) -> Void) {
        completion([], nil)
    }
}
