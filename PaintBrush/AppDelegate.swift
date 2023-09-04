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
    var selectionView:SelectionView!
    @IBOutlet weak var mnuEdit: NSMenu!
   
    func setupPaintBrush(){
      
        viewController = NSApplication.shared.orderedWindows.first?.contentViewController as? ViewController
        mnuEdit.items[8].isHidden = true
        mnuEdit.items[9].isHidden = true
        
        
    }
    @IBAction func mnuFileNew(_ sender: Any) {
        newFileName = Helper.shared.mnuNewFile()
        
    }
    @IBAction func mnuOpen(_ sender: Any) {
        Helper.shared.mnuOpenFile(mnuViewController: viewController)
    }
    @IBAction func mnuFileSaveAs(_ sender: Any) {
        Helper.shared.mnuSaveFileAs(drawView: viewController.drawView, newFileName: newFileName)
    }
 
    @IBAction func mnuCut(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        pasteboard.prepareForNewContents(with: .init())
        pasteboard.setData(selectionView.newImage.tiffRepresentation, forType: NSPasteboard.PasteboardType(rawValue: "image"))
        selectionView.clearSelectionRectangle()
        selectionView.removeFromSuperview()
    }
    @IBAction func mnuCopy(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        pasteboard.prepareForNewContents(with: .init())
        pasteboard.setData(selectionView.newImage.tiffRepresentation, forType: NSPasteboard.PasteboardType(rawValue: "image"))
        selectionView.removeFromSuperview()
        
    }
    @IBAction func mnuSelectRectangle(_ sender: Any) {
        selectionView = SelectionView(frame: NSScreen.main!.frame)
        selectionView.wantsLayer = true
        selectionView.layer!.backgroundColor = NSColor.clear.cgColor
        selectionView.layer!.borderWidth = 15
        selectionView.layer!.borderColor = NSColor.clear.cgColor
        viewController.view.addSubview(selectionView)
       
      
    }
    @IBAction func mnuPaste(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        let imageData = pasteboard.data(forType: NSPasteboard.PasteboardType(rawValue: "image"))
        let newImage = NSImage(data: imageData!)
        let nsImageView = NSImageView(image: newImage!)
        nsImageView.frame = NSScreen.main!.visibleFrame
        nsImageView.wantsLayer = true
        viewController.view.addSubview(nsImageView)
        selectionView.removeFromSuperview()
    }
    @IBAction func mnuDelete(_ sender: Any) {
        viewController.drawView.path.removeAllPoints()
        viewController.drawView.needsDisplay = true
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

