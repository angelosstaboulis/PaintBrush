//
//  ViewController.swift
//  PaintBrush
//
//  Created by Angelos Staboulis on 16/8/23.
//

import Cocoa
import SwiftUI

class ViewController: NSViewController {
    public var drawView = DrawView()
    override func loadView() {
        view = drawView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView.frame = NSScreen.main!.frame
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        
        
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

