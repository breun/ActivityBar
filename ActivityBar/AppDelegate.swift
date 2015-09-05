//
//  AppDelegate.swift
//  ActivityBar
//
//  Created by Nils Breunese on 05-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength) // -1?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let icon = NSImage(named: "statusIcon") {
            icon.template = true
            statusItem.image = icon
            statusItem.menu = statusMenu
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func openActivityMonitor(sender: NSMenuItem) {
    }
    
    @IBAction func openConsole(sender: NSMenuItem) {
    }
    
    @IBAction func quit(sender: NSMenuItem) {
    }
}

