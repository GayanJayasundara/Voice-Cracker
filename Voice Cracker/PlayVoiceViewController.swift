//
//  PlayVoiceViewController.swift
//  Voice Cracker
//
//  Created by Gayan Jayasundara on 2015-09-18.
//  Copyright © 2015 Gayan Jayasundara. All rights reserved.
//

import UIKit
import AVFoundation

class PlayVoiceViewController: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SnailVoice(sender: UIButton) {
        audioPlayer = self.AudioPlayerWithFile("everything", type: "mp3");
        audioPlayer.play()
    }
    
    func AudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        let filepath = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let audioURL = NSURL.fileURLWithPath(filepath!)
        var audioPlayer:AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: audioURL)
        } catch {
            print("NO AUDIO PLAYER")
        }
        return audioPlayer!
    }
}
