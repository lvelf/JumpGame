//
//  SCNNodeExtension.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import SceneKit

extension SCNNode {
    
    func isNotContainedXZ(in boxNode: SCNNode) -> Bool {
        let box = boxNode.geometry as! SCNBox
        let width = Float(box.width)
        
        if abs(position.x - boxNode.position.x) > width / 2.0 {
            return true
        }
        
        if abs(position.z   - boxNode.position.z) > width / 2.0 {
            return true
        }
        
        return false
    }
}

