//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // Audio Visual Foundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        // These two do the same thing.
        // print(sender.titleLabel?.text)
        // print(sender.currentTitle)
        
        playSound(currentKey: sender.currentTitle ?? "<no_name>")
        
        //Reduces the sender's (the button that got pressed) opacity to half.
          sender.alpha = 0.5

          //Code should execute after 0.2 second delay.
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              //Bring's sender's opacity back up to fully opaque.
              sender.alpha = 1.0
          }
        
    }
    
    func playSound(currentKey: String) {
        let url = Bundle.main.url(forResource: currentKey, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
