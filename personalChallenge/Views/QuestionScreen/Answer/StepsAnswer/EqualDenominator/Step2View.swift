//
//  Step2View.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct Step2View: View {
    @Binding var jawaban: Jawaban
    @FocusState private var isFocused: Bool
    @Binding var isDisabledStepSimplify: Bool

    var body: some View {
        VStack {
            StepHeading(title: "Step 2: Cari hasil pembagi untuk sederhanakan  pecahan")
                .padding(.horizontal, 32)
            
            Spacer ()
            
            SimplifyFraction(pembilang: $jawaban.numerator3, penyebut: $jawaban.denominator3, pembagi: $jawaban.dibagi, isDisabled: isDisabledStepSimplify, jawaban: jawaban)
                .focused($isFocused)
            
            Spacer()
                .frame(height: 25)
        }
    }
}

//struct Step2View_Previews: PreviewProvider {
//    static var previews: some View {
//        Step2View()
//    }
//}
