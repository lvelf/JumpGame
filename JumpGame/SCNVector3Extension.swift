//
//  SCNVector3Extension.swift
//  JumpGame
//
//  Created by 诺诺诺诺诺 on 2022/10/2.
//

import SceneKit

extension SCNVector3 {
    
    static func positionFromTransform(_ transform: matrix_float4x4) -> SCNVector3 {
        return SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
    }
}
