//
//  SoundRecordViewController.swift
//  Voice Cracker
//
//  Created by Gayan Jayasundara on 2015-09-17.
//  Copyright © 2015 Gayan Jayasundara. All rights reserved.
//

import UIKit

class SoundRecordViewController: UIViewController {

    @IBOutlet weak var recordingLbl: UILabel!
    @IBOutlet weak var RecordEndBtn: UIButton!
    
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
        //TODO: Show Recording inprogres
        //TODO: Actually record voice
        recordingLbl.hidden = false;
        RecordEndBtn.hidden = false;
    }
    
    @IBAction func stopRecording(sender: UIButton) {
        recordingLbl.hidden = true;
        RecordEndBtn.hidden = true
    }
}

