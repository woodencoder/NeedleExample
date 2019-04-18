//
//  ConsoleLogger.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 15/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import Foundation

class ConsoleLogger: Logger {

    func logMessage(_ message: String) {
        print(message)
    }

}
