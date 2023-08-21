//
//  SimplifyFractionStepView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct SimplifyFractionStepView: View {
    @Binding var Soal: soal
       @Binding var jawaban: Jawaban
       @Binding var operand: String
       @Binding var isDisabledStepSimplify: Bool
       @FocusState private var isFocused: Bool
    var body: some View {
        VStack {
            StepHeading(title: "Step 4: Cari hasil pembagi untuk sederhanakan  pecahan")
                .padding(.horizontal, 32)
            
            Spacer ()
            SimplifyFraction(pembilang: $jawaban.numerator3, penyebut: $jawaban.denominator3, pembagi: $jawaban.dibagi,isDisabled:isDisabledStepSimplify,jawaban:jawaban)
                .focused($isFocused)
            
            Spacer()
        }
        .frame(height: 25)
    }
}

//struct SimplifyFractionStepView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimplifyFractionStepView()
//    }
//}
