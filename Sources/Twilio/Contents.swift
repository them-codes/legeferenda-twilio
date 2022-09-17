//
//  Twilio.swift
//  
//
//  Created by Alexander Gavrikov on 9/24/21.
//

import Vapor

struct TwilioLookup: Content {
    var country_code: String
}

struct TwilioVerify {
    struct Request: Content {
        var Channel: String
        var To: String
        init(sms to: String) {
            self.Channel = "sms"
            self.To = to
        }
        init(email to: String) {
            self.Channel = "email"
            self.To = to
        }
    }
    
    struct OTP: Content {
        var Code: String
        var To: String
        init(_ code: String, to: String) {
            self.Code = code
            self.To = to
        }
    }
}

struct TwilioResponse: Content {
    var status,
        channel,
        date_created, date_updated,
        payee, to, amount,
        sid, account_sid, service_sid : String?
    var valid: Bool
}
