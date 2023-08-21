//
//  AnswerField1.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 15/08/23.
//

import SwiftUI

//This is answer field for direct answer
struct DirectAnswerField: View {
    @Binding var inputJawaban: String
    var isCorrect = true
    var color:Color = Color.gray
    
    var body: some View {
        TextField(
            "",
            text: $inputJawaban
        )
        .multilineTextAlignment(.center)
        .frame(width: 48, height: 48)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color, lineWidth: 2)
        )
        .keyboardType(.numberPad)
        .background(RoundedRectangle(cornerRadius: 10).fill(isCorrect == true ? Color.white : Color.red))
    }
}

struct DirectAnswerField_Previews: PreviewProvider {
    static var previews: some View {
        DirectAnswerField(inputJawaban: Binding.constant(" "))
    }
}
