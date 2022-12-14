//
//  otpSend.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

extension Twilio {
    public func otpSend(smsTo number: String) async throws -> Bool {
        let didSend = try await self.application.client.post(self.verifyUrl, headers: self.headers) { req in
            let formData = TwilioVerify.Request(sms: number)
            try req.content.encode(formData, as: .urlEncodedForm)
        }
        guard didSend.status == .created else {
            throw TwilioError.twilioServerError
        }
        return true
    }
    
    public func otpSend(emailTo email: String) async throws -> Bool {
        let didSend = try await self.application.client.post(self.verifyUrl, headers: self.headers) { req in
            let formData = TwilioVerify.Request(email: email)
            try req.content.encode(formData, as: .urlEncodedForm)
        }
        guard didSend.status == .created else {
            throw TwilioError.twilioServerError
        }
        return true
    }
}
