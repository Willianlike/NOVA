//
//  ArcticInfoRetriever.swift
//  Nova
//
//  Created by Ilia Yurasov on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation

class ArcticInfoRetriever {

    static let APP_ID = "ccbCt3vAAuNXPGMSxXWI"
    static let APP_CODE = "QQI1SrOr7E8xV9UXFHv5sg"

    static let HERE_URL = "https://weather.api.here.com/weather/1.0/report.json?app_id=\(APP_ID)&app_code=\(APP_CODE)&product=observation&name=Antarctic"

    static func retrieve(callback: @escaping (_ success: Bool, _ info: ArcticInfo?) -> Void) {
        let sender = HttpSender()
        sender.send(url: HERE_URL, callback: { (reply, status, error) in
            if (nil == status) {
                print("HTTP: NULL status")
            } else {
                print("HTTP: status=" + String(status!))
            }
            let success = (nil != status && 200 == status)
            if (nil != reply) {
                do {
                    let data = reply!.data(using: .utf8)
                    print("HTTP: reply: \(reply)")
                    if let jsonReply = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                        callback(success, ArcticInfo.fromJson(jsonReply))
                    }
                } catch let error {
                    print(error.localizedDescription)
                    callback(false, nil)
                }
            } else {
                callback(false, nil)
            }
        })
    }
}
