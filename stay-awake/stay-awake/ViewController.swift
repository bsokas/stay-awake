//
//  ViewController.swift
//  stay-awake
//
//  Created by Brian Sokas on 10/10/20.
//  Copyright © 2020 Brian Sokas. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var timerValue: Double = 0

    @IBOutlet weak var nextTriggerIndicator: NSLevelIndicator!
    var timedIndicator: TimedLevelIndicator!
    
    @IBOutlet weak var timerValueEntry: NSPopUpButton!
    @IBAction func handleTimerValueEntry (_ sender: Any) {
        let selected = timerValueEntry.selectedItem
        let selectedValue = Double.init(selected?.title ?? "0")!
        if selectedValue > 0 && selectedValue != timerValue {
            timerValue = selectedValue
            timedIndicator.setTimerInterval(timerValue)
        } else {
            return
        }
        
        timerValueEntry.title = selected!.title
    }
    func populateTimerValues(){
        timerValueEntry.removeAllItems()
        timerValueEntry.addItems(withTitles: (0...60).map(String.init))
    }
    
    @IBOutlet weak var timerActionButton: NSButton!
    let StartTitle = "Start"
    let StopTitle = "Stop"
    @IBAction func handleTimerActionButton (_ sender: Any) {
        let currentTitle = timerActionButton.title
        if currentTitle == StartTitle {
            timerActionButton.title = StopTitle
            _ = timedIndicator.startTimer()
        } else {
            timerActionButton.title = StartTitle
            _ = timedIndicator.stopTimer()
        }
    }
    
    @IBOutlet weak var nextEventLabel: NSTextField!
    // updateNextEventLabel may not be needed, if the value is handled in another handler
    @IBAction func updateNextEventLabel (_ sender: Any) {}
    
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
        timedIndicator = TimedLevelIndicator.init(levelIndicator: nextTriggerIndicator)
//        timedIndicator.setLevelIndicator(nextTriggerIndicator)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

