//
//  StatsUpdater.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import Cocoa

class UIUpdater {
    
    let systemMonitor = SystemMonitor()
    
    let cpuHistory = History<CPUSample>(maxElements: 20)
    
    var memory: MemorySample?
    
    let button: NSButton
    
    init(button: NSButton) {
        self.button = button
    }
    
    func run() {
        // TODO: Don't do this on main UI thread, use a timer to run this as a background task
        // http://stackoverflow.com/questions/29561476/run-background-task-as-loop-in-swift
        while true {
            let cpuSample = systemMonitor.sampleCPU()
            //print(cpuSample)
            cpuHistory.add(cpuSample)
            
            let memorySample = systemMonitor.sampleMemory()
            //print(memorySample)
            memory = memorySample

            button.title = String(format: "%.2f%%", cpuSample.used)
            
            sleep(2)
        }
    }
}