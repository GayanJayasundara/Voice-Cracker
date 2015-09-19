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
        audioPlayer.currentTime = 0;
        audioPlayer.rate = 0.5;
        audioPlayer.play();
    }
    
    @IBAction func KangarooVoice(sender: UIButton) {
        audioPlayer = self.AudioPlayerWithFile("everything", type: "mp3");
        audioPlayer.currentTime = 0;
        audioPlayer.rate = 2.0;
        audioPlayer.play()
    }
    
    @IBAction func StopPlaying(sender: UIButton) {
        audioPlayer.stop();
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
        audioPlayer?.enableRate = true;
        return audioPlayer!
    }
}
