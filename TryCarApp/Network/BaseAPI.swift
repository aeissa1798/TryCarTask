//
//  BaseAPI.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping(M?, String?, Int?) -> Void) {
        let method     = Alamofire.HTTPMethod(rawValue: target.method.rawValue)!
        let parameters = buildParameters(task: target.task)
        let headers    = target.headers
        let url        = target.base + target.path
        
        //call endBackgroundTask() on completion..
        switch UIApplication.shared.applicationState {
        case .active, .background:
            registerBackgroundTask()
            print("App is in background.")
            print("Background time remaining = \(UIApplication.shared.backgroundTimeRemaining) seconds")
        case .inactive:
            endBackgroundTask()
            break
        @unknown default:
            endBackgroundTask()
            break
        }
        Alamofire.request(url, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON {(response) in
                print("😳==URl==\(url) 💁🏻‍♀️==params==\(parameters)")
                let stausCode = response.response?.statusCode ?? 0
                print("Response = \(response)")
                switch response.result {
                case.success(_):
                    // MARK: - func of success Request
                    do {
                        let responseOBj = try? JSONDecoder().decode(M.self, from: response.data!)
                        print("MYDATA = \(String(describing: responseOBj))")
                        self.endBackgroundTask()
                        completion(responseOBj, nil, stausCode)
                    }
                case.failure(_):
                    // MARK: - func of fail request...server error or validation error
                    let errorResponse = try? JSONDecoder().decode(ErrorModel?.self, from: response.data!)
                    self.endBackgroundTask()
                    print("ErrorData : \(String(describing: errorResponse))")
                    if errorResponse == nil {
                        self.endBackgroundTask()
                        completion(nil, errorResponse?.message, 0)
                    }else{
                        self.endBackgroundTask()
                        completion(nil, errorResponse?.message, stausCode)
                    }
                }
            }
    }
    func registerBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.endBackgroundTask()
        }
        assert(backgroundTask != UIBackgroundTaskIdentifier.invalid)
    }
    
    func endBackgroundTask() {
        print("Background task ended.")
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskIdentifier.invalid
    }
}

func buildParameters(task: Task) ->([String: Any], ParameterEncoding) {
    switch task {
    case.requestPlain:
        return ([:], URLEncoding.default)
    case.requestParameters(parameters: let parameters, encoding: let encoding):
        return(parameters, encoding)
    case.getWithParameters:
        return ([:], URLEncoding.default)
    }
}

