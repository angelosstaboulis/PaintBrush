//
//  ViewController.swift
//  PaintBrush
//
//  Created by Angelos Staboulis on 16/8/23.
//

import Cocoa

class ViewController: NSViewController {
    var drawView:DrawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialDrawView()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController {
    func initialDrawView(){
        drawView = DrawView()
        drawView.frame = CGRect(x: 0, y: 0, width: (NSScreen.main?.frame.width)!, height: (NSScreen.main?.frame.height)!)
        self.view.addSubview(drawView)
    }
}
