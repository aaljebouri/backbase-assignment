//
//  SuccessAPIConnector.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

class MockAPIConnector: APIConnector {
    var endpointCaptured:String?
    var methodCaptured:HTTPMethod?
    
    
    override func performCall<T : Codable>(toEndpoint endpoint:String,
                                                using method:HTTPMethod,
                                                responseType:T.Type,
                                                completion: @escaping (_ error:APIError?, _ response:T?) -> Void) {
        endpointCaptured = endpoint
        methodCaptured = method
    }
}
