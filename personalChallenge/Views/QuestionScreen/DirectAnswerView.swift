//
//  DirectAnswerView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct DirectAnswerView: View {
    @Binding var jawaban: Jawaban
    @FocusState var isFocused
    
    var body: some View {
        Spacer ()
        DirectAnswerField(inputJawaban: $jawaban.numerator,isCorrect:jawaban.isNumerator)
            .focused($isFocused)
            
        
        Image (systemName: "minus")
            .resizable()
            .frame(width: 48, height: 2)
            .padding(.vertical, 12)
        
        DirectAnswerField(inputJawaban: $jawaban.denominator,isCorrect: jawaban.isDenominator)
            .focused($isFocused)
            
        Spacer()
        
    }
}

struct DirectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        DirectAnswerView(jawaban: .constant(Jawaban()))
    }
}
