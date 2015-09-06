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
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
        statusItem.menu = statusMenu
        UIUpdater(button: statusItem.button!).run()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
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
    
    private func launch(application: String) {
        NSWorkspace.sharedWorkspace().launchApplication(application)
    }
}
