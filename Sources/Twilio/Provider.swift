//
//  Provider.swift
//
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

public protocol TwilioProvider {
    func otpSend(smsTo number: String) async throws -> HTTPResponseStatus
    func otpSend(emailTo email: String) async throws -> HTTPResponseStatus
    func lookup(by number: String) async throws -> String
    func otpCheck(code otp: String, to: String) async throws -> HTTPResponseStatus
}
