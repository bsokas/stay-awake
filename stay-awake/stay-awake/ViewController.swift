//
//  ViewController.swift
//  stay-awake
//
//  Created by Brian Sokas on 10/10/20.
//  Copyright © 2020 Brian Sokas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var timerValue = 0

    @IBOutlet weak var timerValueEntry: NSPopUpButton!
    @IBAction func handleTimerValueEntry (_ sender: Any) {
        let selected = timerValueEntry.selectedItem
        let selectedValue = Int.init(selected?.title ?? "0")!
        if selectedValue > 0 && selectedValue != timerValue {
            timerValue = selectedValue
            // TODO update the level indicator
            nextTriggerIndicator.minValue = 0
            nextTriggerIndicator.maxValue = Double(timerValue)
            nextTriggerIndicator.warningValue = Double(timerValue) / 2
            nextTriggerIndicator.criticalValue = Double(timerValue) / 4
            nextTriggerIndicator.integerValue = timerValue
        } else {
            return
        }
        
        timerValueEntry.title = selected!.title
    }
    func populateTimerValues(){
        timerValueEntry.removeAllItems()
        timerValueEntry.addItems(withTitles: (1...60).map(String.init))
    }
    
    @IBOutlet weak var timerActionButton: NSButton!
    let StartTitle = "Start"
    let StopTitle = "Stop"
    @IBAction func handleTimerActionButton (_ sender: Any) {
        let currentTitle = timerActionButton.title
        if currentTitle == StartTitle {
            nextTriggerIndicator.fillColor = NSColor.systemGreen
            // TODO handle trigger indicator timer and formatting
            timerActionButton.title = StopTitle
        } else {
            // TODO stop timer and reset level indicator
            nextTriggerIndicator.fillColor = NSColor.systemBlue
            timerActionButton.title = StartTitle
        }
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
        populateTimerValues()
        nextTriggerIndicator.fillColor = NSColor.systemBlue
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

