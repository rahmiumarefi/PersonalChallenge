//
//  Step1View.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct Step1View: View {
    @Binding var Soal: soal
    @Binding var jawaban: Jawaban
    @Binding var operand: String
    @FocusState private var isFocused: Bool
    @Binding var isDisabledStep3: Bool

    var body: some View {
       VStack {
            StepHeading(title: "Step 1: hitung pecahan")
                .padding(.horizontal, 32)
            
            Spacer()
            
            Calculation(pembilang1: String(Soal.fractionPair.f1.numerator), penyebut1: String(Soal.fractionPair.f1.denominator), pembilang2: String(Soal.fractionPair.f2.numerator), penyebut2: String(Soal.fractionPair.f2.denominator), pembilang3: $jawaban.numerator3, penyebut3: $jawaban.denominator3, operand: operand, isDisabled: isDisabledStep3, jawaban: jawaban)
               .focused($isFocused)
            
            Spacer()
                .frame(height: 25)
        }
    }
}


//struct Step1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Step1View()
//    }
//}
