//
//  PollingLocationViewModel.swift
//  Advance Carolina
//
//  Created by Jamone Alexander Kelly on 3/11/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import RxSwift
import Moya
import Moya_Argo

class PollingLocationViewModel {
    var locations: [PollModel]?
    
    init() { }
    
    
    func getLocations(address: String) -> Observable<[PollModel]?> {
        return Observable.create { observe in
            PollProvider.request(PollAPI.PollLocations(address: address)).subscribe {
                event -> Void in
                switch event {
                case .Next(let resp):
                    do {
                        let pollLocations = try resp.mapLocations()
                        
                        self.locations = pollLocations.map { $0 }
                    } catch {
                        print ("error on next")
                    }
                    observe.on(.Next(self.locations))
                    observe.on(.Completed)
                case .Error(let error):
                    print(error)
                    observe.on(.Next(nil))
                case .Completed:
                    observe.on(.Completed)
                }
            }
        }
    }
}

