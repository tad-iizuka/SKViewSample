//
//  ViewController.swift
//  SKViewSample
//
//  Created by Tadashi on 2017/10/22.
//  Copyright © 2017 UBUNIFU Inc. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

	var sk: skView!
	var isFalling: Bool!

	@IBOutlet weak var button: UIButton!
	@IBAction func button(_ sender: Any) {

		let button = sender as! UIButton
		button.isEnabled = false
		self.isFalling = !self.isFalling
		if self.isFalling {
			self.button.setTitle("Stop Falling", for: .normal)
			self.createSnow()
		} else {
			self.button.setTitle("Falling Snow", for: .normal)
			self.stopSnow()
		}
		button.isEnabled = true
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.isFalling = false
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func createSnow() {

		if self.sk == nil {
			self.sk = skView.init(frame: self.view.frame)
		}
		let scene = SKScene(size: self.view.frame.size)
        scene.backgroundColor = UIColor.clear

		let path = Bundle.main.path(forResource: "Snow", ofType: "sks")
		let particle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        particle.name = "Snow"
        particle.position = CGPoint.init(x: self.view.frame.width / 2, y: self.view.frame.height)
        scene.addChild(particle)

		self.sk.presentScene(scene)
        self.sk.backgroundColor = UIColor.clear
        self.view.addSubview(self.sk)
	}
	
	func stopSnow() {
		if self.sk != nil {
			self.sk.removeFromSuperview()
		}
	}
}
