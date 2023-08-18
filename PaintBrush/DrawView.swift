//
//  DrawView.swift
//  PaintBrush
//
//  Created by Angelos Staboulis on 16/8/23.
//

import Foundation
import AppKit
class DrawView: NSView {
    var context:CGContext?
    var lines:[NSPoint] = []
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        drawLine()
    }
    
    func drawLine(){
        
        guard let context = NSGraphicsContext.current?.cgContext else {
            return
        }
        context.setLineWidth(15.0)
        context.setLineCap(.round)
        for line in lines.enumerated(){
            if line.offset==0 {
                context.move(to: line.element)
            }else{
                context.addLine(to: line.element)
            }
            
        }
        NSColor.green.setFill()
        NSColor.green.setStroke()
        context.strokePath()
        
    }

    
    func imageRepresentation()->NSImage{
        let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
        cacheDisplay(in: bounds, to: imageRepresentation)
        return NSImage(cgImage: imageRepresentation.cgImage!, size: bounds.size)
        
    }
    
    override func mouseDown(with event: NSEvent) {
        lines.append(event.locationInWindow)
        setNeedsDisplay(frame)
    }
    override func mouseMoved(with event: NSEvent) {
        lines.append(event.locationInWindow)
        setNeedsDisplay(frame)
        
    }
    override func mouseUp(with event: NSEvent) {
        lines.append(event.locationInWindow)
        setNeedsDisplay(frame)
        
    }
}
