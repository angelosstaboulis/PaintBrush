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
    func mnuCut(cutData:Data){
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setData(cutData, forType: NSPasteboard.PasteboardType("Clipboard"))
    }
    func mnuCopy(copyData:Data){
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setData(copyData, forType: NSPasteboard.PasteboardType("Clipboard"))
    }
    func mnuPaste()->Data{
        let pasteboard = NSPasteboard.general
       
        return pasteboard.data(forType: NSPasteboard.PasteboardType("Clipboard"))!
    }
    func mnuSelectAll(){
        
    }
    func mnuDelete(){
        
    }
}
