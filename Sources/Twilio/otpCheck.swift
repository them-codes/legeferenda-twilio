//
//  otpCheck.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

extension Twilio {
    public func otpCheck(code otp: String, to: String) async throws -> Bool {
        let isOtpOk = try await self.application.client.post(self.checkUrl, headers: self.headers) { req in
            try req.content.encode(TwilioVerify.OTP(otp, to: to), as: .urlEncodedForm)
        }
        guard let isValid = try? isOtpOk.content.decode(TwilioResponse.self) else {
            throw TwilioError.twilioServerError
        }
        guard isValid.valid else {
            return false
        }
        return true
    }
}
