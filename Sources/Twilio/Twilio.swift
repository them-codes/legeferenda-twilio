//
//  Twilio.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

public struct Twilio: TwilioProvider {
    struct ConfigurationKey: StorageKey {
        typealias Value = TwilioConfiguration
    }
    
    let application: Application
    
    public var configuration: TwilioConfiguration? {
        get {
            application.storage[ConfigurationKey.self]
        }
        nonmutating set {
            application.storage[ConfigurationKey.self] = newValue
        }
    }
    
    public init(_ app: Application) {
        self.application = app
    }
}
