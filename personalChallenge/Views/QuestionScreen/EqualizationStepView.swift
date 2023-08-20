//
//  EqualizationStepView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 20/08/23.
//

import SwiftUI

struct EqualizationStepView: View {
    @Binding var Soal: soal
       @Binding var jawaban: Jawaban
       @Binding var operand: String
       @Binding var isDisabledStep1: Bool
       @FocusState private var isFocused: Bool
       
       var body: some View {
           VStack {
               Steps(title: "Step 1: Samakan penyebut")
                   .padding(.horizontal, 32)
               
               Spacer()
               
               DenominatorEqualization(fraction: $Soal.fractionPair, pengali1: $jawaban.dikali1, pengali2: $jawaban.dikali2, operand: operand, isDisbaled: isDisabledStep1, jawaban: jawaban)
                   .focused($isFocused)
               
               Spacer()
                   .frame(height: 25)
           }
       }
   }

struct EqualizationStepView_Previews: PreviewProvider {
    static var previews: some View {
        EqualizationStepView()
    }
}
