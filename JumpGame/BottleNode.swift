//
//  BottleNode.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import UIKit
import SceneKit

class BottleNode: SCNNode {
    
    private let minimumHeight: CGFloat = 0.15
    private let durationToReduce: TimeInterval = 1.0 / 600.0
    private let coneNodeHeight: CGFloat = 0.2
    private let reduceHeightUnit:CGFloat = 0.001
    
    var maskPosition: Bool = false
    var positionY: Float = 0.0
    
    lazy var myMaterial: SCNMaterial = {
       let material = SCNMaterial()
        material.diffuse.contents = UIColor.randomColor()
        return material
    }()
    
    lazy var sphereNode: SCNNode = {
        let sphere = SCNSphere(radius: 0.01)
        sphere.materials = [myMaterial]
        return SCNNode(geometry: sphere)
    }()
    
    lazy var coneNode: SCNNode = {
        let cone = SCNCone(topRadius: 0.0, bottomRadius: 0.05,
                           height: coneNodeHeight)
        cone.materials = [myMaterial]
        return SCNNode(geometry: cone)
    }()
    
    override init() {
        super.init()
        
        sphereNode.position = SCNVector3(0, coneNodeHeight / 2.0, 0)
        coneNode.addChildNode(sphereNode)
        addChildNode(coneNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scaleHeight() {
        if !maskPosition {
            positionY = position.y
            maskPosition = true
        }
        let coneGeometry = coneNode.geometry as! SCNCone
        if coneGeometry.height > minimumHeight {
            sphereNode.runAction(SCNAction.move(by: SCNVector3(0, -reduceHeightUnit, 0), duration: durationToReduce))
            coneNode.runAction(SCNAction.group([SCNAction.run({ _ in
                coneGeometry.height -= self.reduceHeightUnit
            })]))
        }
    }
    
    func playPressMusic() {
        if let source = SCNAudioSource(fileNamed: "presssound") {
            print("why?")
            let action = SCNAction.playAudio(source, waitForCompletion: false)
            coneNode.runAction(action)
        } else {
            print("no where")
            return
        }
    }
    
    func recover() {
        sphereNode.position = SCNVector3(0, coneNodeHeight / 2.0, 0)
        (coneNode.geometry as! SCNCone).height = coneNodeHeight
    }
}
