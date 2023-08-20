//
//  Helper.swift
//  PaintBrush
//
//  Created by Angelos Staboulis on 17/8/23.
//

import Foundation
import AppKit
class Helper{
    static let shared = Helper()
    private init(){}
    func mnuNewFile()->String{
        let newFile = NSSavePanel()
        var newFileName:String!
        newFile.title = "Create New File"
        if newFile.runModal() == .OK {
            newFileName = newFile.directoryURL!.path + "/" + newFile.nameFieldStringValue
        }
        return newFileName
    }
    func mnuOpenFile(mnuViewController:ViewController){
            let openFile = NSOpenPanel()
            openFile.title = "Open File"
            openFile.canChooseFiles = true
            openFile.canChooseDirectories = true
            if openFile.runModal() == .OK {
                let contents =  URL(fileURLWithPath: openFile.url!.path)
                let image = NSImage(contentsOf: contents)
                let imageView = NSImageView(image: image!)
                imageView.frame = mnuViewController.view.bounds
                mnuViewController.view.addSubview(imageView)
            }
    }
    func mnuSaveFileAs(mnuViewController:ViewController,newFileName:String){
        let saveFileAs = NSSavePanel()
        saveFileAs.title = "Save File As"
        saveFileAs.nameFieldStringValue = newFileName
        if saveFileAs.runModal() == .OK{
            FileManager.default.createFile(atPath:saveFileAs.nameFieldStringValue, contents: mnuViewController.drawView.imageRepresentation().tiffRepresentation, attributes: [:])
        }
    }
    func mnuCut(cutData:Data,viewController:ViewController){
        viewController.drawView.removeFromSuperview()
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setData(cutData, forType: NSPasteboard.PasteboardType("Clipboard"))
    }
    func mnuCopy(copyData:Data){
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setData(copyData, forType: NSPasteboard.PasteboardType("Clipboard"))
    }
    func mnuPaste(viewController:ViewController){
        let pasteboard = NSPasteboard.general
        let image = NSImage(data:pasteboard.data(forType: NSPasteboard.PasteboardType("Clipboard"))!)
        let imageView = NSImageView(image: image!)
        imageView.frame = NSScreen.main!.visibleFrame
        viewController.view.addSubview(imageView)
    }
    func mnuDelete(viewController:ViewController){
        for view in viewController.view.subviews{
            view.removeFromSuperview()
        }
    }
   
}
