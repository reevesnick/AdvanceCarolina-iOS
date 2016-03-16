//
//  PollModelResponseHelper.swift
//  Advance Carolina
//
//  Created by Jamone Alexander Kelly on 3/11/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import Foundation
import Moya
import Moya_Argo

extension Response {
    
    func mapLocations() throws -> [PollModel] {
        
        return try mapArrayWithRootKey("pollingLocations")
    }
}