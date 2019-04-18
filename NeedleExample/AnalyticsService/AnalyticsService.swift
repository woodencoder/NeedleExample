//
//  AnalyticsService.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import Foundation

struct AnalyticsEvent {
    let name: String
}

protocol AnalyticsService: AnyObject {
    func sendAnalytics(for event: AnalyticsEvent)
}


class SimpleAnalyticsService: AnalyticsService {

    func sendAnalytics(for event: AnalyticsEvent) {
        print("Send analytics for event: " + event.name.capitalized)
    }

}
