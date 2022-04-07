//
//  ViewController.swift
//  waiw
//
//  Created by Ömer Faruk KISIK on 7.04.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private let speechSynthesizer = AVSpeechSynthesizer()
    private var pitch: Float = 1.0
    private var rate = AVSpeechUtteranceDefaultSpeechRate
    private var volume: Float = 1.0
    private var letterIndex = 0
    private var alphabet: AlphabetModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
        //UserDefaults.standard.set(["tr"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        speechSynthesizer.delegate = self
        alphabet = Constants().englishAlpabet
    }

    @IBAction func buttonTap(_ sender: Any) {
        //readLetterByIndex(index: letterIndex)
        let utterance = AVSpeechUtterance(string: "1")
        self.speechSynthesizer.speak(utterance)
    }
    
    func readLetterByIndex(index: Int) {
        if letterIndex < alphabet!.letters.count {
            if !alphabet!.letters[letterIndex].examples.isEmpty {
                let utterance = AVSpeechUtterance(string: alphabet!.letters[letterIndex].examples[0])
                self.speechSynthesizer.speak(utterance)
            } else {
                letterIndex += 1
                readLetterByIndex(index: letterIndex)
            }
        }
    }
    
}

extension ViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        letterIndex += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            readLetterByIndex(index: letterIndex)
        }
        
    }
}
