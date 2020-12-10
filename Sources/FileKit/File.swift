//
//  OpenFile.swift
//  DMCRead
//
//  Created by Richard Street on 11/8/19.
//  Copyright © 2019 Richard Street. All rights reserved.
//

import Cocoa

// class must be public for package to work
public class File {
    public var title = "Read Title"
    public var message = "Test save message"
    public var allowedFileTypes = ["ccf"]
    public var canCreateDirectories = true
    public var useDefaultURL = true // Set false if you don't want to save last file opened
    public var url: URL?
    public var userDefaultKey: String?
    
    public func open() -> URL? {
        let openPanel = NSOpenPanel()
        openPanel.title = title
        openPanel.message = message
        openPanel.allowedFileTypes = allowedFileTypes
        openPanel.canCreateDirectories = canCreateDirectories
        if let url = self.url { // url provided
            print("url provided")
            openPanel.directoryURL = url
        } else {
            print("going to use default...")
            if useDefaultURL {
                if let url = GetDefaultURL() {
                    print("got default \(url.path)")
                    openPanel.directoryURL = url
                    }
            }
        }
        
        let response = openPanel.runModal()
        
        if response == NSApplication.ModalResponse.OK {
            guard let url = openPanel.url else { return nil }
            print(url.path )
            print()
            if self.url == nil {
                if useDefaultURL {
                    SaveDefultURL(url)
                }
            }
            return url
        }
        
        if response == NSApplication.ModalResponse.cancel {
            print("No open url selected")
            return nil
        }
        return nil
    }
        
    public func save() -> URL? {
        let savePanel = NSSavePanel()
        savePanel.title = title
        savePanel.message = message
        savePanel.allowedFileTypes = allowedFileTypes
        savePanel.canCreateDirectories = canCreateDirectories
        savePanel.canSelectHiddenExtension = true
        savePanel.showsHiddenFiles = true
        savePanel.treatsFilePackagesAsDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.canSelectHiddenExtension = true
        
        if let url = self.url {
            savePanel.directoryURL = url
            savePanel.nameFieldStringValue = url.lastPathComponent
        } else {
            if useDefaultURL {
                if let url = GetDefaultURL() {
                    savePanel.directoryURL = url.deletingLastPathComponent()
                    savePanel.nameFieldStringValue = url.lastPathComponent
                }
            }
        }
        
        print()
        print("opening panel...")
        let response = savePanel.runModal()
        print("got response")
        
        if let exts = savePanel.allowedFileTypes {
            print("exts \(exts)")
        }
        if response == NSApplication.ModalResponse.OK {
            guard let url = savePanel.url else { return nil}
            if useDefaultURL {
                SaveDefultURL(url)
            }
            print(url.path)
            return url
        }
        
        if response == NSApplication.ModalResponse.cancel {
            print("No save url selected")
            return nil
        }
        return nil
    }

    public init() {
        title = "Title"
        message = "Message"
    }
    
    func GetDefaultURL() -> URL? {
        // get default directgory
        if let key = userDefaultKey {
            if let path = UserDefaults.standard.string(forKey: key) {
                print("Retrieved key \(key) \(path)")
                return URL(fileURLWithPath: path)
            }
        } else {
            if let path = UserDefaults.standard.string(forKey: "DefaultPath") {
                return URL(fileURLWithPath: path)
                // print("using url from default:  \(myURL.path)")
            }
        }
        return nil
    }
    
    func SaveDefultURL(_ url: URL) {
        if let key = userDefaultKey {
            UserDefaults.standard.set(url.path, forKey: key)
            print("Saved key \(key): \(url.path)")
        } else {
            if url.path != "" {
                UserDefaults.standard.set(url.path, forKey: "DefaultPath")
                // print("saving default path: \(url.path)")
            }
        }        
    }
}
