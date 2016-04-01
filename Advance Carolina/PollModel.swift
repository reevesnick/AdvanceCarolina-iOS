//
//  PollModel.swift
//  Advance Carolina
//
//  Created by Jamone Alexander Kelly on 3/11/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import Foundation
import Argo
import Curry
import Moya_Argo

struct PollModel: Decodable {
    var locationName: String?
    var line1: String?
    var line2: String?
    var line3: String?
    var city: String?
    var state: String?
    var zip: String?
    var pollingHours: String?
    var notes: String?
    
    
    static func decode(json: JSON) -> Decoded<PollModel> {
        return curry(PollModel.init)
            <^> json <|? ["address", "locationName"]
            <*> json <|? ["address", "line1"]
            <*> json <|? ["address", "line2"]
            <*> json <|? ["address", "line3"]
            <*> json <|? ["address", "city"]
            <*> json <|? ["address", "state"]
            <*> json <|? ["address", "zip"]
            <*> json <|? "notes"
            <*> json <|? "pollingHours"
    }
}
