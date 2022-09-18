//
//  Error.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

public enum TwilioError: Error {
    case wrongOtp,
         unsupportedCountry,
         twilioServerError
    
    public var identifier: String {
        switch self {
        case .wrongOtp:
            return "wrongOtp"
        case .unsupportedCountry:
            return "unsupportedCountry"
        case .twilioServerError:
            return "twilioServerError"
        }
    }

    public var reason: String {
        switch self {
        case .wrongOtp:
            return "wrongOtp"
        case .unsupportedCountry:
            return "unsupportedCountry"
        case .twilioServerError:
            return "twilioServerError"
        }
    }
}
