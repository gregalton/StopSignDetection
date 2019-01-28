//
//  ViewController.swift
//  StopSignDetection
//
//  Created by Greg Alton on 1/28/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation

class ViewController: UIViewController, ARSCNViewDelegate {

    var siri = AVSpeechSynthesizer()
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = ARReferenceImage.referenceImages(inGroupNamed: "signs", bundle: nil)
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //guard let imageAnchor = anchor as? ARImageAnchor else {return}
        say(phrase: "stop sign ahead")
    }
    
    func say(phrase: String) {
        let content = AVSpeechUtterance(string: phrase)
        siri.speak(content)
    }
    
}
