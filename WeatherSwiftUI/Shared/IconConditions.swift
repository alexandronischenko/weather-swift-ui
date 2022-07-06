//
//  IconConditions.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 30.06.2022.
//

import Foundation
import SwiftUI

enum Condition: String {
    case sunMax = "sun.max"
    case overcast = "cloud.fill"
    case cloud = "cloud"
    case cloudDrizzleFill = "cloud.drizzle.fill"
    case cloudRainFill = "cloud.rain.fill"
    case cloudHeavyRainFill = "cloud.heavyrain.fill"
    case cloudSnowFill = "cloud.snow.fill"
    case cloudBoltFill = "cloud.bolt.fill"
    case cloudSunFill = "cloud.sun.fill"
    case cloudSunRainFill = "cloud.sun.rain.fill"
    case smokeFill = "smoke.fill"
}

extension Condition {
    static func castToCondition(iconName: String) -> Condition {
        switch iconName {
        case "clear": return Condition.sunMax
        case "partly-cloudy": return Condition.cloudSunFill
        case "cloudy": return Condition.cloud
        case "overcast": return Condition.overcast
        case "partly-cloudy-and-light-rain": return Condition.cloudSunRainFill
        case "partly-cloudy-and-rain": return Condition.cloudRainFill
        case "cloudy-and-light-rain": return Condition.cloudDrizzleFill
        case "overcast-and-light-rain": return Condition.cloudDrizzleFill
        case "cloudy-and-rain": return Condition.cloudRainFill
        case "overcast-thunderstorms-with-rain": return Condition.cloudHeavyRainFill
        case "overcast-and-wet-snow ": return Condition.cloudDrizzleFill
        case "overcast-and-snow": return Condition.cloudSnowFill
        case "partly-cloudy-and-light-snow": return Condition.cloudSnowFill
        case "cloudy-and-light-snow": return Condition.cloudSnowFill
        case "overcast-and-light-snow": return Condition.cloudSnowFill
        case "cloudy-and-snow": return Condition.cloudSnowFill
        default:
            return .sunMax
        }
    }
}












