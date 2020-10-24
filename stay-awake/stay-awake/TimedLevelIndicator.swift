//
//  TimedLevelIndicator.swift
//  stay-awake
//
//  Created by Brian Sokas on 10/24/20.
//  Copyright © 2020 Brian Sokas. All rights reserved.
//

import Cocoa

class TimedLevelIndicator: NSObject {
    var DEFAULT_TIME_INTERVAL = 1.0 // Default window is 1sec
    var levelIndicator: NSLevelIndicator!
    var timeInterval: Double = 0.0
    var timer: Timer!
    
    // Constructor that sets levelIndicator object
    init(levelIndicator: NSLevelIndicator){
        self.levelIndicator = levelIndicator
    }
    
    // Constructor that sets levelIndicator object and timeInterval value
    init(levelIndicator: NSLevelIndicator, timeInterval: Double){
        self.levelIndicator = levelIndicator
        self.timeInterval = timeInterval
        super.init()
        updateValueIndicators()
    }
    
    func setLevelIndicator(_ levelIndicator: NSLevelIndicator) {
        self.levelIndicator = levelIndicator
    }
    
    func setTimerInterval(_ timeInterval: Double) {
        if timeInterval > 0 && timeInterval != self.timeInterval {
            self.timeInterval = timeInterval
            levelIndicator.maxValue = timeInterval
            levelIndicator.doubleValue = timeInterval
            updateValueIndicators()
        }
    }
    
    // Update the warning and critical levels
    private func updateValueIndicators(){
        if timeInterval <= 0 { return }
        levelIndicator.warningValue = timeInterval / 2
        levelIndicator.criticalValue = timeInterval / 4
    }
    
    func startTimer() -> Error! {
        if timeInterval <= 0 {
            return fatalError("Unable to start timer. Timer interval value of \(timeInterval) is not valid")
        }
        
        levelIndicator.fillColor = NSColor.systemGreen
        timer = Timer.scheduledTimer(withTimeInterval: DEFAULT_TIME_INTERVAL, repeats: true, block: { _ in
            if self.levelIndicator.doubleValue == 0 {
                // TODO move mouse when @ 0
                self.levelIndicator.doubleValue = self.levelIndicator.maxValue
            } else {
                self.levelIndicator.doubleValue -= 1
            }
        })
        
        return nil
    }
    
    func stopTimer() -> Error! {
        timer.invalidate()
        levelIndicator.fillColor = NSColor.systemBlue
        levelIndicator.maxValue = timeInterval
        return nil
    }
}
