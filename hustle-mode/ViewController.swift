//
//  ViewController.swift
//  hustle-mode
//
//  Created by Arnis on 27/01/2018.
//  Copyright © 2018 Arnis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var holder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustle: UILabel!
    @IBOutlet weak var on: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("kjhsdkfjh")
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        holder.isHidden = false
        background.isHidden = true
        button.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 200, width: 375, height: 267)
        }) { (finished) in
            self.hustle.isHidden = false
            self.on.isHidden = false
        }
    }
}

