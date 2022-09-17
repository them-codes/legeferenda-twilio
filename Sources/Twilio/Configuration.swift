//
//  Configuration.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

public struct TwilioConfiguration {
    public let twilioUsername: String
    public let twilioPassword: String
    public let twilioService: String
    
    public static var env: TwilioConfiguration {
        guard
            let usr = Environment.get("TW_USR"),
            let psw = Environment.get("TW_PSW"),
            let sid = Environment.get("TW_SID") else {
            fatalError("Twilio Env Vars Missing")
        }
        return .init(username: usr,
                     password: psw,
                     service: sid)
    }
    
    public init(username: String, password: String, service: String) {
        self.twilioUsername = username
        self.twilioPassword = password
        self.twilioService = service
    }
}
