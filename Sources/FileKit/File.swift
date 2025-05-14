//
//  File.swift
//  DMCRead
//
//  Created by Richard Street on 11/8/19.
//  Copyright © 2019 Richard Street. All rights reserved.
//

import Cocoa
import UniformTypeIdentifiers

// class must be public for package to work
@available(macOS 11.0, *)
public class File {
    public var title = "Read Title"
    public var message = "Test save message"
    // public var allowedFileTypes: [String]? = nil
    public var allowedContentTypes: [UTType] = [.text]
    public var canCreateDirectories = true
    public var nameFieldLabel = "Save as:"
    public var useDefaultURL = true // Set false if you don't want to save last file opened
    public var url: URL? // user suplied urs for use, otherwise use default url
    public var userDefaultKey: String? // saves default in user preferences (plist)
    public var defaultFileName: String? // name of file (appended to url)

    public func open() -> URL? {
        // print("open dialog...")
        let openPanel = NSOpenPanel()
        openPanel.title = title
        openPanel.message = message
        openPanel.allowsOtherFileTypes = true
        openPanel.allowedContentTypes = allowedContentTypes
        openPanel.canChooseFiles = true
        openPanel.canCreateDirectories = canCreateDirectories
        if let url = self.url { // url provided
            // print("url provided")
            openPanel.directoryURL = url
        } else {
            // print("going to use default...")
            if useDefaultURL {
                if let url = GetDefaultURL() {
                    // print("got default \(url.path)")
                    openPanel.directoryURL = url
                    }
            }
        }
        
        let response = openPanel.runModal()
        
        if response == NSApplication.ModalResponse.OK {
            guard let url = openPanel.url else { return nil }
            // print(url.path )
            // print()
            if self.url == nil {
                if useDefaultURL {
                    SaveDefultURL(url)
                }
            }
            return url
        }
        
        if response == NSApplication.ModalResponse.cancel {
            // print("No open url selected")
            return nil
        }
        return nil
    }
    
    public func openDirectory() -> URL? {
        // print("openDirectory...")
        let openPanel = NSOpenPanel()
        openPanel.title = title
        openPanel.message = message
        openPanel.allowsOtherFileTypes = true
        openPanel.allowedContentTypes = allowedContentTypes
        // openPanel.allowedFileTypes = allowedFileTypes
        openPanel.canCreateDirectories = canCreateDirectories
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        if let url = self.url { // url provided
            // print("url provided")
            openPanel.directoryURL = url
        } else {
            // print("going to use default...")
            if useDefaultURL {
                if let url = GetDefaultURL() {
                    // print("got default \(url.path)")
                    openPanel.directoryURL = url
                    }
            }
        }
        
        let response = openPanel.runModal()
        
        if response == NSApplication.ModalResponse.OK {
            guard let url = openPanel.url else { return nil }
            // print(url.path )
            // print()
            if self.url == nil {
                if useDefaultURL {
                    SaveDefultURL(url)
                }
            }
            return url
        }
        
        if response == NSApplication.ModalResponse.cancel {
            // print("No open directory url selected")
            return nil
        }
        return nil
    }
        
    public func save() -> URL? {
        // print("save dialog...")
        let savePanel = NSSavePanel()
        savePanel.title = title
        savePanel.message = message
        savePanel.allowsOtherFileTypes = true
        savePanel.allowedContentTypes = allowedContentTypes
        savePanel.canCreateDirectories = canCreateDirectories
        savePanel.canSelectHiddenExtension = true
        savePanel.showsHiddenFiles = false
        savePanel.treatsFilePackagesAsDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.nameFieldLabel = nameFieldLabel

        if let url = self.url {
            // print("save url supplied")
            savePanel.directoryURL = url.deletingLastPathComponent()
            savePanel.nameFieldStringValue = url.lastPathComponent
        } else {
            if useDefaultURL {
                // print("use default url")
                if let url = GetDefaultURL() {
                    savePanel.directoryURL = url.deletingLastPathComponent()
                    savePanel.nameFieldStringValue = url.lastPathComponent
                }
            }
        }
        
        if let defaultName = defaultFileName {
            savePanel.nameFieldStringValue = defaultName
        }
        // print("save params selected.")
        // print()
        // print("opening save panel...")
        let response = savePanel.runModal()
        // print("got response")
        
        if response == NSApplication.ModalResponse.OK {
            guard let url = savePanel.url else { return nil}
            if useDefaultURL {
                SaveDefultURL(url)
            }
            // print(url.path)
            return url
        }
        
        if response == NSApplication.ModalResponse.cancel {
            // print("No save url selected")
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
                // print("Retrieved key \(key) \(path)")
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
            // print("Saved key \(key): \(url.path)")
        } else {
            if url.path != "" {
                UserDefaults.standard.set(url.path, forKey: "DefaultPath")
                // print("saving default path: \(url.path)")
            }
        }        
    }
}
