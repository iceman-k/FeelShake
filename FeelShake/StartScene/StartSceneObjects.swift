//
//  DrawStartObjects.swift
//  FeelShake
//
//  Created by Nagakawa Keisuke on 2018/01/28.
//  Copyright © 2018年 Kei. All rights reserved.
//

import Foundation
import SpriteKit

// StartScene delegateのプロトコル（約束）
protocol StartSceneDelegateProtocol {
    func addChild(_ node: SKNode) -> Void
    var view: SKView? { get }
    
}



class StartSceneObjects{
    let frame:CGRect
    let size:CGSize
    let center:CGPoint
    let upperCenter:CGPoint

    private var circle : SKShapeNode?
    var delegate: StartSceneDelegateProtocol!



    init(frame:CGRect) {
        self.frame = frame
        self.size = frame.size
        self.center = CGPoint(x: frame.midX, y:frame.midY)
        self.upperCenter = CGPoint(
            x: frame.midX,
            y: 0.5*frame.midY + 0.5*frame.maxY)
        
    }
    
    func CreateStartSceneCircleNode() -> SKShapeNode? {
        let w = (self.frame.width + self.frame.height) * 0.40
        self.circle = SKShapeNode.init(
            rectOf: CGSize.init(width: w * dConst.radRatio, height: w * dConst.radRatio),
            cornerRadius: w * 0.5 * dConst.radRatio)
        self.circle?.fillColor = UIColor.gray
        self.circle?.alpha = 0.5
        self.circle?.lineWidth = 0.0
        self.circle?.position = self.upperCenter
        return circle

    }
    
    // 依頼人クラスでもある
    func drawTitle(fontNamed:String="HiraKakuProN-W3",
                   color:UIColor=UIColor.black,
                   text:String,
                   fontSize: CGFloat = 100.0,
                   position:CGPoint){
        let titleLabel = SKLabelNode(fontNamed: fontNamed)
        titleLabel.fontColor = color
        titleLabel.text = text
        titleLabel.fontSize = fontSize
        titleLabel.position = position
        delegate.addChild(titleLabel)
    }
    
    // 依頼人クラスでもある
    func drawButton(withText text:String,
                    fontName: String = basicFont,
                    color:UIColor = UIColor.black,
                    fontSize:CGFloat = fontSizeForButton,
                    position:CGPoint,
                    moveTo scene:SKScene ,
                    transition: SKTransition = SKTransition.fade(with: UIColor.white, duration: transitionTime)) {
        let button = ButtonNode(fontNamed: fontName)
        button.fontColor = color
        button.text = text
        button.fontSize = fontSize
        button.position = position
        button.didTapButtonClosure = {
            self.delegate.view!.presentScene(
                scene, transition: SKTransition.fade(with: UIColor.white, duration: transitionTime))
        }

        delegate.addChild(button)
    }
  

}
