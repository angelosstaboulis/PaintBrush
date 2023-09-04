//
//  DrawView.swift
//  PaintBrush
//
//  Created by Angelos Staboulis on 16/8/23.
//

import Foundation
import AppKit
import Cocoa
class DrawView: NSImageView {
    var selection:Bool!=false

    var path: NSBezierPath = NSBezierPath()
    override init(frame: NSRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func mouseDown(with event: NSEvent) {
        path.move(to: convert(event.locationInWindow, from: nil))
    }
    
    override func mouseDragged(with event: NSEvent) {
        path.line(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor.green.set()
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        path.lineWidth = 15.0
        path.stroke()
    }
    func imageRepresentation()->NSImage{
          let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
          cacheDisplay(in: bounds, to: imageRepresentation)
          return NSImage(cgImage: imageRepresentation.cgImage!, size: bounds.size)
          
    }
 
    func mnuDelete(viewController:ViewController){
        for view in viewController.view.subviews{
            view.removeFromSuperview()
        }
    }

    
}
