//
//  EqualizationResultStepView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct EqualizationResultStepView: View {
    @Binding var jawaban: Jawaban
    @Binding var operand: String
    @Binding var isDisabledStep2: Bool
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            StepHeading(title: "Step 2: Tuliskan hasil persamaan penyebut")
                .padding(.horizontal, 32)
            
            Spacer()
            
            DenominatorEqualizationResult(pembilang1: $jawaban.numerator1, pembilang2: $jawaban.numerator2, penyebut1: $jawaban.denominator1, penyebut2: $jawaban.denominator2,operand:operand,isDisabled:isDisabledStep2,jawaban:jawaban)
                .focused($isFocused)
            
            
            Spacer()
               
        }
        .frame(height: 25)
    }
}

struct EqualizationResultStepView_Previews: PreviewProvider {
    static var previews: some View {
        EqualizationResultStepView(jawaban: .constant(Jawaban()), operand: .constant("plus"), isDisabledStep2: .constant(false))
    }
}
