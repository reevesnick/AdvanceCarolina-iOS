//
//  PollAPI.swift
//  Advance Carolina
//
//  Created by Jamone Alexander Kelly on 3/11/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import Foundation
import RxSwift
import Moya

private func JSONResponseDataFormatter(data: NSData) -> NSData {
    do {
        let dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        let prettyData =  try NSJSONSerialization.dataWithJSONObject(dataAsJSON, options: .PrettyPrinted)
        return prettyData
    } catch {
        return data //fallback to original data if it cant be serialized
    }
}

//let PollProvider = RxMoyaProvider<PollAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])
let PollProvider = RxMoyaProvider<PollAPI>()

extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

public enum PollAPI {
    case PollLocations(address: String)
}

extension PollAPI: TargetType {
    public var baseURL: NSURL {
        switch self {
        case .PollLocations(_):
            return NSURL(string: "https://www.googleapis.com")!
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .PollLocations(_):
            return .GET
        }
    }
    
    public var path: String {
        switch self {
        case .PollLocations(_):
            return "/civicinfo/v2/voterinfo"
        }
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case .PollLocations(let address):
            return [
            "address": address,
                "key": "AIzaSyBv_gphp6mNE2JbSmiPlu-QUNJyuviKMQg" // Google key
            ]
        }
    }
    
    public var sampleData: NSData {
        switch self {
        case .PollLocations(_):
            return NSData()
        }
    }
}