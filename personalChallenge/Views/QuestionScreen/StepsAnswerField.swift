//
//  AnswerField.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 14/08/23.
//

import SwiftUI

// This is answer field for step by step answer
struct StepsAnswerField: View {
    @Binding var inputJawaban: String
    var isDisabled:Bool = false
    var isCorrect = true
    
    var body: some View {
        
        TextField(
            "",
            text: $inputJawaban
        )
        .multilineTextAlignment(.center)
        .frame(width: 40, height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
        .background(RoundedRectangle(cornerRadius: 10).fill(isCorrect == true ? Color.white : Color.red))
        .keyboardType(.numberPad)
        .disabled(isDisabled)
    }
}


struct StepsAnswerField_Previews: PreviewProvider {
    static var previews: some View {
        StepsAnswerField(inputJawaban: Binding.constant(" "), isDisabled: false)
    }
}
