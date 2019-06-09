//
//  ArcticInfo.swift
//  Nova
//
//  Created by Ilia Yurasov on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation

class ArcticInfo {
    var temperature: Float = 0.0
    var dewPoint: Float = 0.0
    var humidity: Float = 0.0
    var windSpeed: Float = 0.0

    static func fromJson(_ data: [String: Any]) -> ArcticInfo? {
        var info = ArcticInfo()

        guard let observations: [String: Any] = data["observations"] as? [String: Any] else { return nil }
        guard let location: [[String: Any]] = observations["location"] as? [[String: Any]] else { return nil }
        for i in location {
            let loc: [String: Any] = i
            guard let country: String = loc["country"] as? String else { continue }
            // do trick Arctic > Antarctica
            if ("Antarctica" != country) {
                continue
            }
            guard let observation: [[String: Any]] = loc["observation"] as? [[String: Any]] else { continue }
            for i in observation {
                let obs: [String: Any] = i
                // fill info and go out
                if let temperature: String = obs["temperature"] as? String {
                    info.temperature = Float(temperature)!
                }
                if let dewPoint: String = obs["dewPoint"] as? String {
                    info.dewPoint = Float(dewPoint) ?? 0
                }
                if let humidity: String = obs["humidity"] as? String {
                    info.humidity = Float(humidity) ?? 0
                }
                if let windSpeed: String = obs["windSpeed"] as? String {
                    info.windSpeed = Float(windSpeed) ?? 0
                }
                return info
            }
        }

        return nil
    }
}
