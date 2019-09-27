//
//  DateHelper.swift
//  Task
//
//  Created by Jordan Lamb on 9/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

extension Date {

func stringValue() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    
    return formatter.string(from: self)
    }
}
