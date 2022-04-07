//
//  SpellModel.swift
//  waiw
//
//  Created by Ömer Faruk KISIK on 8.04.2022.
//

import Foundation

class LetterModel {
    let letter: String
    let examples: [String]
    
    init(letter: String, examples: [String] = []) {
        self.letter = letter
        self.examples = examples
    }
}
