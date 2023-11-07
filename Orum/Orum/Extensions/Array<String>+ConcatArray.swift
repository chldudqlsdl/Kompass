//
//  Array<String>+ConcatArray.swift
//  Orum
//
//  Created by 차차 on 11/5/23.
//

import Foundation

extension Array<String> {
    func concatArray() -> String {
        var result = ""
        
        for i in 0 ..< self.count {
            result += self[i]
            
//            if i != self.count - 1 {
//                result += ","
//            }
        }
        
        return result
    }
}
