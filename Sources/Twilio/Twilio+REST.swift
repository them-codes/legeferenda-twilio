//
//  File.swift
//  
//
//  Created by Alexander Gavrikov on 17.09.2022.
//

import Vapor

extension Twilio {
    var verifyUrl: URI {
        guard let sid = self.configuration?.twilioService else {
            fatalError("Configuration missing. Please use app.twilio.configuration = ...")
        }
        return URI(string: "https://verify.twilio.com/v2/Services/\(sid)/Verifications")
    }
    var checkUrl: URI {
        guard let sid = self.configuration?.twilioService else {
            fatalError("Configuration missing. Please use app.twilio.configuration = ...")
        }
        return URI(string: "https://verify.twilio.com/v2/Services/\(sid)/VerificationCheck")
    }
    
    var headers: HTTPHeaders {
        guard let conf = self.configuration else {
            fatalError("Configuration missing. Please use app.twilio.configuration = ...")
        }
        var headers = HTTPHeaders()
        headers.basicAuthorization = BasicAuthorization(
            username: conf.twilioUsername,
            password: conf.twilioPassword)
        headers.contentType = .urlEncodedForm
        return headers
    }
    
    func lookupUrl(_ pnum: String) -> URI {
        return URI(string: "https://lookups.twilio.com/v1/PhoneNumbers/\(pnum)")
    }
}
