//
//  EqualizeDenominator.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 15/08/23.
//

import SwiftUI

struct DenominatorEqualization: View {
    var fraction:FractionPair
    @Binding var pengali1:String
    @Binding var pengali2:String
    var operand:String
    var isDisbaled = false
    var jawaban:Jawaban
    
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        Text("\(fraction.f1.numerator)")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Image(systemName: "multiply")
                        StepsAnswerField(inputJawaban: $pengali1, isDisabled: isDisbaled,isCorrect:jawaban.isDikali1)
                    }
                    
                    Image (systemName: "minus")
                        .resizable()
                        .frame(width: 100, height: 2)
                        .padding(.vertical, 12)
                    
                    HStack(spacing: 12) {
                        Text("\(fraction.f1.denominator)")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Image(systemName: "multiply")
                        StepsAnswerField(inputJawaban: $pengali1,isDisabled: isDisbaled,isCorrect:jawaban.isDikali1)
                    }
                }
                
                Image(systemName: operand)
                    .padding(.horizontal)
                
                VStack{
                    VStack(spacing: 4) {
                        HStack(spacing: 12) {
                            Text("\(fraction.f2.numerator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            Image(systemName: "multiply")
                            StepsAnswerField(inputJawaban: $pengali2,isDisabled: isDisbaled,isCorrect:jawaban.isDikali2)
                        }
                        
                        Image (systemName: "minus")
                            .resizable()
                            .frame(width: 100, height: 2)
                            .padding(.vertical, 12)
                        
                        HStack(spacing: 12) {
                            Text("\(fraction.f2.denominator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            Image(systemName: "multiply")
                            StepsAnswerField(inputJawaban: $pengali2,isDisabled: isDisbaled,isCorrect:jawaban.isDikali2)
                        }
                    }
                }
            }
        }
    }
}

struct DenominatorEqualization_Previews: PreviewProvider {
    static var previews: some View {
        DenominatorEqualization(fraction:
            FractionPair(
                f1: (numerator: 3, denominator: 4, decimal: 0.75),
                f2: (numerator: 1, denominator: 2, decimal: 0.5)) ,
            pengali1: .constant(" "),
            pengali2: .constant(" "),
            operand: " ",
            jawaban: Jawaban())
    }
}
