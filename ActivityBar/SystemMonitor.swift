//
//  SystemMonitor.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import SystemKit

class SystemMonitor {
    var system = System()
    
    func sampleCPU() -> CPUSample {
        let (sys, user, idle, nice) = system.usageCPU()
        return CPUSample(system: sys, user: user, idle: idle, nice: nice)
    }
    
    func sampleMemory() -> MemorySample {
        let (free, active, inactive, wired, compressed) = System.memoryUsage()
        return MemorySample(free: free, active: active, inactive: inactive, wired: wired, compressed: compressed)
    }
}