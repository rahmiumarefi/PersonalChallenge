//
//  GenerateStory.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 11/08/23.
//

import Foundation


func generateNamaPecahan (F:Fraction)-> String{
    let numeratorF:Int = F.numerator
    let denominatorF:Int = F.denominator
    
    if(numeratorF == 1){
        if(denominatorF == 2){
            return "setengah"
        }else{
            return "seper"+arrayAngka[denominatorF-1]
        }
    }
    
    return arrayAngka[numeratorF - 1] + " per " + arrayAngka[denominatorF-1]
}

func generateSoalCerita (F1:Fraction,F2:Fraction) -> soalCerita{
    
    let randNum = Int.random(in: 0...listCerita.count-1)
    
    var cerita = listCerita[randNum].cerita
    let operand =  listCerita[randNum].operand
    
    let pecahan1 = generateNamaPecahan(F: F1)
    let pecahan2 = generateNamaPecahan(F: F2)
    cerita = cerita.replacingOccurrences(of: "$1", with: "__\(pecahan1)__")
    cerita = cerita.replacingOccurrences(of: "$2", with: "__\(pecahan2)__")
    
    return (cerita,operand)
}
