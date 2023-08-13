//
//  GenerateOperand.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 11/08/23.
//

import Foundation

enum Operand:String, CaseIterable {
    case plus = "plus"
    case minus = "minus"
}

func generateOperand() -> Operand {
    let op = Operand.allCases.randomElement()!
    
    return op
}
