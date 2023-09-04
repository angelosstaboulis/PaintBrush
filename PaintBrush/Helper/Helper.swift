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
    func mnuSaveFileAs(drawView:DrawView,newFileName:String){
        let saveFileAs = NSSavePanel()
        saveFileAs.title = "Save File As"
        saveFileAs.nameFieldStringValue = newFileName
        if saveFileAs.runModal() == .OK{
            FileManager.default.createFile(atPath:saveFileAs.nameFieldStringValue, contents: drawView.imageRepresentation().tiffRepresentation, attributes: [:])
        }
    }
}
