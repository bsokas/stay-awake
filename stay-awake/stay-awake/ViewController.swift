//
//  ViewController.swift
//  stay-awake
//
//  Created by Brian Sokas on 10/10/20.
//  Copyright © 2020 Brian Sokas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timerValueEntry: NSPopUpButton!
    @IBAction func handleTimerValueEntry (_ sender: Any) {}
    
    @IBOutlet weak var timerActionButton: NSButton!
    let StartTitle = "Start"
    let StopTitle = "Stop"
    @IBAction func handleTimerActionButton (_ sender: Any) {
        let currentTitle = timerActionButton.title
        timerActionButton.title = currentTitle == StartTitle ? StopTitle : StartTitle
    }
    
    @IBOutlet weak var nextEventLabel: NSTextField!
    // updateNextEventLabel may not be needed, if the value is handled in another handler
    @IBAction func updateNextEventLabel (_ sender: Any) {}
    
    @IBOutlet weak var nextTriggerIndicator: NSLevelIndicator!
    // Not sure if I need an action for the indicator, TBD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        nextEventLabel.stringValue = "No upcoming events."
        timerActionButton.title = "Start"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

