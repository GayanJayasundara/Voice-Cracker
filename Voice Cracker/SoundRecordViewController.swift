//
//  SoundRecordViewController.swift
//  Voice Cracker
//
//  Created by Gayan Jayasundara on 2015-09-17.
//  Copyright © 2015 Gayan Jayasundara. All rights reserved.
//

import UIKit
import AVFoundation

class SoundRecordViewController: UIViewController,AVAudioRecorderDelegate {

  @IBOutlet weak var recordingLbl: UILabel!
  @IBOutlet weak var RecordEndBtn: UIButton!
  
  var audioRecorder : AVAudioRecorder!
  var recordedVoice : RecordedVoice!
  
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
      audioRecorder.stop()
      let audioSession = AVAudioSession.sharedInstance()
      try! audioSession.setActive(false)
      
    } else{
    
    }

  }
  
  func recordVoice() -> Bool {
    let docPath =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String;
    
    //let currentDateTime = NSDate()
    //let formatter = NSDateFormatter()
    //formatter.dateFormat = "ddMMyyyy-HHmmss"
    //let voiceClipName = formatter.stringFromDate(currentDateTime)+".wav"
    
    let recordingName = "my_audio.wav"
    
    let pathArray = [docPath, recordingName]
    let filePath = NSURL.fileURLWithPathComponents(pathArray)
    
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
    
    do {
      try audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
      audioRecorder.delegate = self
      audioRecorder.meteringEnabled = true
      audioRecorder.prepareToRecord()
      audioRecorder.record()
      return true
    } catch {
      print("NO AUDIO Recorder")
      return false
    }
  }
  
  func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
    if (flag){
      recordedVoice = RecordedVoice()
      recordedVoice.filePathUrl = recorder.url
      recordedVoice.title = recorder.url.lastPathComponent
      
      self.performSegueWithIdentifier("PlayAudio", sender: recordedVoice)
    } else {
      print("Recording was not successfull")
      RecordEndBtn.enabled = true
      RecordEndBtn.hidden = true
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "PlayAudio") {
      let playAudio:PlayVoiceViewController = segue.destinationViewController as! PlayVoiceViewController
      let data = sender as! RecordedVoice
      playAudio.receivedAudio = data
      
    }
  }
}

