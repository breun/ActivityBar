//
//  MemorySample.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

struct MemorySample: CustomStringConvertible {
    let free, active, inactive, wired, compressed: Double
    
    var description: String {
        return "MemorySample(free: \(free) GB, active: \(active) GB, inactive: \(inactive) GB, wired: \(wired) GB, compressed: \(compressed) GB)"
    }
}