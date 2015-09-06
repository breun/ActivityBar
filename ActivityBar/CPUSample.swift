//
//  CPUSample.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

struct CPUSample: CustomStringConvertible {
    let system, user, idle, nice: Double
    
    var description: String {
        return "CPUSample(system: \(system)%, user: \(user)%, idle: \(idle)%, nice: \(nice)%)"
    }
    
    var used: Double {
        return system + user + nice
    }
}