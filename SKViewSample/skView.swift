//
//  skView.swift
//  SKViewSample
//
//  Created by Tadashi on 2017/10/22.
//  Copyright © 2017 UBUNIFU Inc. All rights reserved.
//

import UIKit
import SpriteKit

class skView: SKView {

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		let hitView:UIView? = super.hitTest(point, with: event)
		if(self == hitView) {
			return nil
		}
		return hitView
	}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
