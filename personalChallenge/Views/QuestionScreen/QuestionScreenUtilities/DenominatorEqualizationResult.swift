//
//  DoCalculation.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 16/08/23.
//

import SwiftUI

struct DenominatorEqualizationResult: View {
    @Binding var pembilang1:String
    @Binding var pembilang2:String
    @Binding var penyebut1:String
    @Binding var penyebut2:String
    var  operand:String
    var isDisabled:Bool = false
    var jawaban:Jawaban
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    StepsAnswerField(inputJawaban: $pembilang1,isDisabled: isDisabled,isCorrect: jawaban.isNumerator1)
                }
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 50, height: 2)
                    .padding(.vertical, 12)
                HStack(spacing: 12) {
                    StepsAnswerField(inputJawaban: $penyebut1,isDisabled: isDisabled,isCorrect: jawaban.isDenominator1)
                }
            }
            
            Image(systemName: operand)
                .padding(.horizontal)
            
            VStack{
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        StepsAnswerField(inputJawaban: $pembilang2,isDisabled: isDisabled,isCorrect: jawaban.isNumerator2)
                    }
                    
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 50, height: 2)
                        .padding(.vertical, 12)
                    HStack(spacing: 12) {
                        StepsAnswerField(inputJawaban: $penyebut2,isDisabled: isDisabled,isCorrect: jawaban.isDenominator2)
                    }
                }
            }
        }
    }
}


struct DenominatorEqualizationResult_Previews: PreviewProvider {
    static var previews: some View {
        DenominatorEqualizationResult(pembilang1: .constant(" "), pembilang2: .constant(" "), penyebut1: .constant(" "), penyebut2: .constant(" "), operand: "plus", jawaban: Jawaban())
    }
}
