//
//  SoundRecordViewController.swift
//  Voice Cracker
//
//  Created by Gayan Jayasundara on 2015-09-17.
//  Copyright © 2015 Gayan Jayasundara. All rights reserved.
//

import UIKit
import AVFoundation

class SoundRecordViewController: UIViewController {

  @IBOutlet weak var recordingLbl: UILabel!
  @IBOutlet weak var RecordEndBtn: UIButton!
  
  var audioRecorder : AVAudioRecorder!
  override func viewWillAppear(animated: Bool) {
    recordingLbl.hidden = true;
    RecordEndBtn.hidden = true;
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func recordAudio(sender: UIButton) {
    //TODO: Actually record voice
    recordingLbl.hidden = false
    RecordEndBtn.hidden = false
    
    self.recordVoice();
  }
  
  @IBAction func stopRecording(sender: UIButton) {
    recordingLbl.hidden = true
    RecordEndBtn.hidden = true
    if self.audioRecorder != nil {
      audioRecorder.stop();
    } else{
    
    }

  }
  
  func recordVoice() -> Bool {
    let docPath =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String;
    
    let currentDateTime = NSDate()
    let formatter = NSDateFormatter()
    formatter.dateFormat = "ddMMyyyy-HHmmss"
    let voiceClipName = formatter.stringFromDate(currentDateTime)+".wav"
    
    let pathArray = [docPath, voiceClipName]
    let filePath = NSURL.fileURLWithPathComponents(pathArray)
    
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
    
    do {
      try audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
      audioRecorder.meteringEnabled = true
      audioRecorder.prepareToRecord()
      audioRecorder.record()
      return true
    } catch {
      print("NO AUDIO Recorder")
      return false
    }
  }
}

