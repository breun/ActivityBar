//
//  AppDelegate.swift
//  ActivityBar
//
//  Created by Nils Breunese on 05-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import Cocoa
import SystemKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        icon?.template = true
        statusItem.button?.image = icon
        
        statusItem.menu = statusMenu
        
        start()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func start() {
        // TODO: Don't block main UI thread, use a timer
        // http://stackoverflow.com/questions/29561476/run-background-task-as-loop-in-swift
        var system = System()
        while true {
            let usageCPU = system.usageCPU()
            print("System: \(usageCPU.system)%")
            print("User: \(usageCPU.user)%")
            print("Idle: \(usageCPU.idle)%")
            print("Nice: \(usageCPU.nice)%")
            
            print("----")
            
            let memoryUsage = System.memoryUsage()
            print("Free: \(memoryUsage.free) GB")
            print("Active: \(memoryUsage.active) GB")
            print("Inactive: \(memoryUsage.inactive) GB")
            print("Wired: \(memoryUsage.wired) GB")
            print("Compressed: \(memoryUsage.compressed) GB")
            
            print("----")
            
            sleep(2)
        }
    }
    
    @IBAction func openActivityMonitor(sender: NSMenuItem) {
        launch("/Applications/Utilities/Activity Monitor.app")
    }
    
    @IBAction func openConsole(sender: NSMenuItem) {
        launch("/Applications/Utilities/Console.app")
    }
    
    @IBAction func quit(sender: NSMenuItem) {
        exit(0)
    }
    
    private func launch(appName: String) {
        NSWorkspace.sharedWorkspace().launchApplication(appName)
    }
}
