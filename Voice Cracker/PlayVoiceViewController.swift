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
  var receivedAudio: RecordedVoice!
  var engine : AVAudioEngine!
  var audioFile : AVAudioFile!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    engine = AVAudioEngine();
    audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    audioPlayer = self.AudioPlayerWithFile(receivedAudio.filePathUrl);
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func SnailVoice(sender: UIButton) {
    audioPlayer.currentTime = 0;
    audioPlayer.rate = 0.5;
    audioPlayer.play();
  }
    
  @IBAction func KangarooVoice(sender: UIButton) {
    audioPlayer.currentTime = 0;
    audioPlayer.rate = 2.0;
    audioPlayer.play()
  }
    
  @IBAction func StopPlaying(sender: UIButton) {
    if audioPlayer != nil {
      if audioPlayer.playing {
        audioPlayer.stop()
      }
    }
  }
  
  @IBAction func ChipMunkVoice(sender: UIButton) {
    //audioPlayer = self.AudioPlayerWithFile(receivedAudio.filePathUrl);
    
    
    playAudioWithVariablePitch(1000,rate: 1)
  }
  
  func AudioPlayerWithFile(audioURL:NSURL) -> AVAudioPlayer  {
    //let filepath = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
    //let audioURL = NSURL.fileURLWithPath(filepath!)
    var audioPlayer:AVAudioPlayer?
    
    do {
      try audioPlayer = AVAudioPlayer(contentsOfURL: audioURL)
    } catch {
      print("NO AUDIO PLAYER")
    }
      audioPlayer?.enableRate = true;
      return audioPlayer!
  }
  
  func playAudioWithVariablePitch(pitch: Float, rate:Float) {
    
    let audioPlayerNode = AVAudioPlayerNode()
    engine.attachNode(audioPlayerNode)
    
    let changePitchEffect = AVAudioUnitTimePitch()
    changePitchEffect.pitch = pitch
    changePitchEffect.rate = rate
    engine.attachNode(changePitchEffect)
    
    engine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
    engine.connect(changePitchEffect, to: engine.outputNode, format: nil)
    
    audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
    do {
      try engine.start()
      audioPlayerNode.play()
    } catch let error as NSError{
      print(error.localizedFailureReason)
    }
    
  }
  
  func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
    audioPlayer.stop()
    engine.stop()
    engine.reset()
  }
}
