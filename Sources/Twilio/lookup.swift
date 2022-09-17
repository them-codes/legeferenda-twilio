//
//  lookup.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

extension Twilio {
    public func lookup(by number: String) async throws -> String {
        let phoneLookup = try await self.application.client
            .get(self.lookupUrl(number), headers: self.headers)
        guard let result = try? phoneLookup.content.decode(TwilioLookup.self) else {
            throw Abort(.badGateway) // SMS Server Error
        }
        return result.country_code
    }
}
