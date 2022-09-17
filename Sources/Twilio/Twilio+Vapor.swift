//
//  Twilio+Vapor.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

extension Application {
    public var twilio: Twilio { .init(self) }
}

extension Request {
    public var twilio: Twilio { .init(self.application) }
}
