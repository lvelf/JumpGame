//
//  BubbleTextNode.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import UIKit
import SceneKit

class BubbleTextNode: SCNNode {
    
    private let bubbleDepth: Float = 0.015//the 'depth' of 3D text
    
    init(text: String, at position: SCNVector3) {
        super.init()
        
        let billboardConstrait = SCNBillboardConstraint()
        billboardConstrait.freeAxes = SCNBillboardAxis.Y
        
        //lights
        let omniBackLight = SCNLight()
        omniBackLight.type = .omni
        omniBackLight.color = UIColor.white
        let omniBackLightNode = SCNNode()
        omniBackLightNode.light = omniBackLight
        omniBackLightNode.position = SCNVector3(position.x - 2, 0, position.z - 2)
        
        let omniFrontLight = SCNLight()
        omniFrontLight.type = .omni
        let omniFrontLightNode = SCNNode()
        omniFrontLightNode.light = omniFrontLight
        omniFrontLightNode.position = SCNVector3(position.x + 2, 0, position.z + 2)
        
        self.addChildNode(omniBackLightNode)
        self.addChildNode(omniFrontLightNode)
        
        
        //Text
        let bubble = SCNText(string: text, extrusionDepth: CGFloat(bubbleDepth / 5.0))
        bubble.font = UIFont(name: "HelveticaNeue", size: 0.18)
        bubble.alignmentMode =
        convertFromCATextLayerAlignmentMode(CATextLayerAlignmentMode.center)
        bubble.firstMaterial?.diffuse.contents = UIColor.white
        bubble.firstMaterial?.specular.contents = UIColor.white
        bubble.firstMaterial?.isDoubleSided = false
        bubble.flatness = 0.01
        bubble.chamferRadius = 0.05
        
        //bubble
        let (minBound, maxBound) = bubble.boundingBox
        let bubbleNode = SCNNode(geometry: bubble)
        
        //center node - to Centre-Bottom Point
        bubbleNode.pivot = SCNMatrix4MakeTranslation((maxBound.x - minBound.x) / 2, minBound.y, bubbleDepth / 2)
        //reduce default text size
        bubbleNode.scale = SCNVector3Make(0.2, 0.2, 0.2)
        
        let backgroundBox = SCNBox(width: CGFloat(maxBound.x - minBound.x) / 2,
                                   height: 0.05,
                                   length: 0.02,
                                   chamferRadius: 0.01)
        
        backgroundBox.firstMaterial?.diffuse.contents = UIColor.lightGray
        backgroundBox.firstMaterial?.specular.contents = UIColor(white: 0.5, alpha:  0.8)
        backgroundBox.firstMaterial?.isDoubleSided = false
        
        //Box Node
        let backgroundNode = SCNNode(geometry: backgroundBox)
        bubbleNode.position = SCNVector3(0, -0.01, bubbleDepth)
        backgroundNode.addChildNode(bubbleNode)
        backgroundNode.name = "backgroundNode"
        
        self.addChildNode(backgroundNode)
        
        self.name = text
        self.constraints = [billboardConstrait]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    
    fileprivate func convertFromCATextLayerAlignmentMode(_ input: CATextLayerAlignmentMode) -> String {
        return input.rawValue
    }
    
}
