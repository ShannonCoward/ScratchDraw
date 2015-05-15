//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Shannon Armon on 5/14/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    @IBAction func changeColor(sender:UIButton) {
        
        if let color = sender.backgroundColor {
            
        scratchPad.currentColor = color
            
//            if color == UIColor.whiteColor() {
//                var context = UIGraphicsGetCurrentContext()
//                CGContextSetLineWidth(context, 25.0)
//            }
        }
    }

    
    @IBAction func clearLines(sender: AnyObject) {
        
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
    }
    
    @IBOutlet weak var scratchPad: SratchView!   //<====Setting up view

    override func viewDidLoad() {
        super.viewDidLoad()
        
////        view.addSubview(scratchPad) //<===setting up canvas
////        scratchPad.frame = view.frame
//        scratchPad.backgroundColor = UIColor.whiteColor()
        
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            
            let location = touch.locationInView(scratchPad)
            scratchPad.newScratchWidthStartPoint(location)
        
        }
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
        
                let location = touch.locationInView(scratchPad)
              //  scratchPad.updateCurrentLineWithLastPoint(location)
              scratchPad.addPointToCurrentScratch(location)
        }
        
    }
    
    @IBAction func undoButton(sender:UIButton){
        
        if scratchPad.scratches.count > 0 {
            
            var removedLine = scratchPad.scratches.removeLast()
            scratchPad.setNeedsDisplay()
            
        }
        
    }
    
    IBAction func strokeSize(sender:UISlider){
    
        
    
    }
    
}



