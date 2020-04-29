//
//  UserModel.swift
//  DACatHandbook
//
//  Created by MinhNV-GD on 4/23/20.
//  Copyright © 2020 MinhNV-GD. All rights reserved.
//

import Foundation

struct UserModel {
    var un: String!
    var id:Int!
    
    init() {
    }
    
    init(object: Any) {
        if let dic: Dictionary<String, Any> = object as? Dictionary<String, Any>{
            if let username = dic["login"] as? String {
                self.un = username
            } else {
                self.un = ""
            }
            
            if let id = dic["id"] as? Int {
                self.id = id
            } else {
                self.id = 0
            }
        } else {
            self.un = ""
            self.id = 0
        }
    }
}
