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
    
    func add(element: Element) {
        while entries.count > maxElements-1 {
            entries.removeFirst()
        }
        entries.append(element)
    }
    
    func generate() -> IndexingGenerator<[Element]> {
        return entries.generate()
    }
    
    func enumerate() -> EnumerateSequence<[Element]> {
        return entries.enumerate()
    }
    
    subscript(x: Int) -> Element {
        return entries[x]
    }
}