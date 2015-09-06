//
//  StatsUpdater.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import Cocoa

// TODO: Decouple model from view
class UIUpdater {
    
    let systemMonitor = SystemMonitor()
    
    // Model
    let cpuHistory: History<CPUSample>
    let maxCPUEntries = 20
    var memory: MemorySample?
    
    // View
    let button: NSButton
    
    init(button: NSButton) {
        self.button = button
        cpuHistory = History<CPUSample>(maxElements: maxCPUEntries)
    }
    
    func run() {
        // TODO: Don't do this on main UI thread, use a timer to run this as a background task
        // http://stackoverflow.com/questions/29561476/run-background-task-as-loop-in-swift
        while true {
            let cpuSample = systemMonitor.sampleCPU()
            //print(cpuSample)
            cpuHistory.add(cpuSample)
            
            memory = systemMonitor.sampleMemory()
            //print(memory)

            button.title = String(format: "%.2f%%", cpuSample.used)
            //button.image = renderImage()
            
            sleep(2)
        }
    }
    
    // TODO: I don't think I understand how this works yet...
    func renderImage() -> NSImage {
        let size = NSSize(width: 40, height: 20) // TODO: What should this be?
        let rect = NSRect(origin: NSMakePoint(0, 1), size: size)
        let image = NSImage(size: size)
        //let path = createPathFromCPUHistory(cpuHistory, size: size)
        
        image.lockFocus()
        
        image.drawAtPoint(NSMakePoint(0, 1), fromRect: rect, operation: NSCompositingOperation.CompositeSourceOver, fraction: 1.0)
        image.unlockFocus()
        
        return image
    }
    
    func createPathFromCPUHistory(cpuHistory: History<CPUSample>, size: NSSize) -> NSBezierPath {
        let width = size.width
        let height = size.height
        let xStepSize = distance(width, numberOfElements: maxCPUEntries) // x-distance between points on the graph
        let path = NSBezierPath()
        
        path.moveToPoint(NSMakePoint(width, height)) // Start at bottom right
        for cpuSample in cpuHistory {
            path.relativeLineToPoint(NSMakePoint(-xStepSize, height * CGFloat(cpuSample.idle)))
        }
        path.relativeLineToPoint(NSMakePoint(0, height)) // Drop back to baseline after drawing last sample
        path.closePath()
        path.fill()
        return path
    }
    
    func distance(totalDistance: CGFloat, numberOfElements: Int) -> CGFloat {
        return totalDistance / CGFloat(numberOfElements-1)
    }
}