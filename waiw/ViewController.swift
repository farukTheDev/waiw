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

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }

    @IBAction func buttonTap(_ sender: Any) {
    
        let utterance = AVSpeechUtterance(string: "Hi")
        //utterance.voice = AVSpeechSynthesisVoice(identifier: "en-EN")
        self.speechSynthesizer.speak(utterance)
    }
    
}

