//
//  History.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

class History<Element>: SequenceType {
    
    var entries = [Element]()
    var maxElements: Int
    
    var count: Int {
        return entries.count
    }
    
    init(maxElements: Int) {
        self.maxElements = maxElements
    }
    
    // Most recent addition becomes history[0]
    // History is truncated to keep size no larger than maxElements
    func add(element: Element) {
        while entries.count > maxElements-1 {
            entries.removeLast()
        }
        entries = [element] + entries
    }
    
    // Support for: for i in history ...
    func generate() -> IndexingGenerator<[Element]> {
        return entries.generate()
    }
    
    // Support for: for (index, entry) in history ...
    func enumerate() -> EnumerateSequence<[Element]> {
        return entries.enumerate()
    }
    
    // Support for: history[i]
    subscript(x: Int) -> Element {
        return entries[x]
    }
}