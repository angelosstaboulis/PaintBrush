//
//  AppDelegate.swift
//  PaintBrush
//
//  Created by Angelos Staboulis on 16/8/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var viewController:ViewController!
    var newFileName:String!
    var drawView:DrawView!
    @IBOutlet weak var mnuEdit: NSMenu!
    func setupPaintBrush(){
        viewController =  (NSApplication.shared.orderedWindows.first?.contentViewController as? ViewController)!
        mnuEdit.items[5].isHidden = true
        mnuEdit.items[6].isHidden = true
    }
    @IBAction func mnuFileNew(_ sender: Any) {
        newFileName = Helper.shared.mnuNewFile()
       
    }
    @IBAction func mnuOpen(_ sender: Any) {
        Helper.shared.mnuOpenFile(mnuViewController: viewController)
    }
    @IBAction func mnuFileSaveAs(_ sender: Any) {
        Helper.shared.mnuSaveFileAs(mnuViewController: viewController, newFileName: newFileName)
    }
    @IBAction func mnuCut(_ sender: Any) {
        Helper.shared.mnuCut(cutData: (viewController.drawView.imageRepresentation().tiffRepresentation)!, viewController: viewController)
    }
    @IBAction func mnuCopy(_ sender: Any) {
        Helper.shared.mnuCopy(copyData: (viewController.drawView.imageRepresentation().tiffRepresentation)!)
    
    }
    @IBAction func mnuPaste(_ sender: Any) {
        Helper.shared.mnuPaste(viewController: viewController)
       
    }
    @IBAction func mnuDelete(_ sender: Any) {
        Helper.shared.mnuDelete(viewController: viewController)
    }
    
    @IBAction func mnuQuit(_ sender: Any) {
        exit(0)
    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        setupPaintBrush()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

