//
//  DoCalculationFractionTimesFactor.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 16/08/23.
//

import SwiftUI

struct Calculation: View {
    var pembilang1:String
    var penyebut1:String
    var pembilang2:String
    var penyebut2:String
    @Binding var pembilang3:String
    @Binding var penyebut3:String
    var operand:String
    var isDisabled:Bool = false
    var jawaban:Jawaban
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                Text(pembilang1)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 2)
                    .padding(.vertical, 4)
                
                Text(penyebut1)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
            }
            
            Image(systemName: operand)
                .padding(.horizontal)
            
            VStack(spacing: 4) {
                Text(pembilang2)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 2)
                    .padding(.vertical, 4)
                
                Text(penyebut2)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
            }
            
            Image(systemName: "equal")
                .padding(.horizontal)
            
            VStack(spacing: 4) {
                StepsAnswerField(inputJawaban: $pembilang3,isDisabled:isDisabled,isCorrect: jawaban.isNumerator3)
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 2)
                    .padding(.vertical, 4)
                
                StepsAnswerField(inputJawaban: $penyebut3,isDisabled:isDisabled,isCorrect: jawaban.isDenominator3)
            }
        }
    }
}

struct Calculation_Previews: PreviewProvider {
    static var previews: some View {
        Calculation(pembilang1: "6", penyebut1: "8", pembilang2: "4", penyebut2: "8", pembilang3: Binding.constant(" "), penyebut3: Binding.constant(" "), operand: "plus", jawaban: Jawaban())
    }
}
