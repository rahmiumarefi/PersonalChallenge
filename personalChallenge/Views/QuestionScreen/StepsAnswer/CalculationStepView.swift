//
//  CalculationStepView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 20/08/23.
//

import SwiftUI

struct CalculationStepView: View {
    @Binding var jawaban: Jawaban
    @Binding var operand: String
    @Binding var isDisabledStep3: Bool
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            StepHeading(title: "Step 3: Hitunglah operasi aritmatika pecahan")
                .padding(.horizontal, 32)
            
            Spacer()
            
            Calculation(pembilang1: jawaban.numerator1, penyebut1: jawaban.denominator1, pembilang2: jawaban.numerator2, penyebut2: jawaban.denominator2, pembilang3: $jawaban.numerator3, penyebut3: $jawaban.denominator3, operand: operand, isDisabled: isDisabledStep3, jawaban: jawaban)
                .focused($isFocused)
            
            Spacer()
        }
        .frame(height: 25)
    }
}

struct CalculationStepView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationStepView(jawaban: .constant(Jawaban()), operand: .constant("plus"), isDisabledStep3: .constant(false))
    }
}
