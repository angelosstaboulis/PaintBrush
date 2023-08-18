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
    var saveFileAs = NSSavePanel()
    var newFileName:String!
    var drawView:DrawView!
    
    @IBAction func mnuFileNew(_ sender: Any) {
        let newFile = NSSavePanel()
        newFile.title = "Create New File"
        if newFile.runModal() == .OK {
            newFileName = newFile.directoryURL!.path + "/" + newFile.nameFieldStringValue
        }
       
    }
    @IBAction func mnuOpen(_ sender: Any) {
            let openFile = NSOpenPanel()
            openFile.title = "Open File"
            openFile.canChooseFiles = true
            openFile.canChooseDirectories = true
            if openFile.runModal() == .OK {
                let contents =  URL(fileURLWithPath: openFile.url!.path)
                let image = NSImage(contentsOf: contents)
                let imageView = NSImageView(image: image!)
                imageView.frame = NSScreen.main!.frame
                viewController.view.addSubview(imageView)
            }
    }
    @IBAction func mnuFileSaveAs(_ sender: Any) {
        saveFileAs.title = "Save File As"
        saveFileAs.nameFieldStringValue = self.newFileName
        saveFileAs.begin { [self] response in
            if response == .OK {
                FileManager.default.createFile(atPath:saveFileAs.nameFieldStringValue, contents: viewController.drawView.imageRepresentation().tiffRepresentation, attributes: [:])
            }
        }
        saveFileAs.runModal()
    }
    @IBAction func mnuCut(_ sender: Any) {
        viewController.drawView.removeFromSuperview()
        Helper.shared.mnuCut(cutData: (viewController.drawView.imageRepresentation().tiffRepresentation)!)
      
       
    }
    @IBAction func mnuCopy(_ sender: Any) {
        Helper.shared.mnuCopy(copyData: (viewController.drawView.imageRepresentation().tiffRepresentation)!)
    
    }
    @IBAction func mnuPaste(_ sender: Any) {
        let image = NSImage(data:Helper.shared.mnuPaste())
        let imageView = NSImageView(image: image!)
        imageView.frame = NSScreen.main!.visibleFrame
        viewController.view.addSubview(imageView)
       
    }
    @IBAction func mnuDelete(_ sender: Any) {
        for view in viewController.view.subviews{
            view.removeFromSuperview()
        }
    }
    
    @IBAction func mnuQuit(_ sender: Any) {
        exit(0)
    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        viewController =  (NSApplication.shared.orderedWindows.first?.contentViewController as? ViewController)!
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

