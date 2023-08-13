//
//  SortFraction.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 11/08/23.
//

import Foundation

func sortFraction(operand:Operand, fraction1:Double, fraction2:Double) -> (f1:Double, f2:Double) {
    let f1 = fraction1
    let f2 = fraction2
    
    if operand == .plus {
        return (f1: f1, f2: f2)
    }
    
    let diff = f1 - f2
    
    if diff < 0 {
        return(f1:f2,f2:f1)
    }
    
    return (f1: f1, f2: f2)
}
