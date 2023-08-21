//
//  Step3View.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct Step3View: View {
    @Binding var jawaban: Jawaban
    @FocusState private var isFocused: Bool
       var body: some View {
           VStack {
               StepHeading(title: "Step 3: Hitung Hasil sederhana")
                   .padding(.horizontal, 32)
               
               Spacer ()
               
               DirectAnswerField(inputJawaban: $jawaban.numerator4)
                   .focused($isFocused)
               
               Image(systemName: "minus")
                   .resizable()
                   .frame(width: 48, height: 2)
                   .padding(.vertical, 12)
               
               DirectAnswerField(inputJawaban: $jawaban.denominator4)
                   .focused($isFocused)
               
               Spacer()
                   .frame(height: 25)
           }
       }
   }
//struct Step3View_Previews: PreviewProvider {
//    static var previews: some View {
//        Step3View()
//    }
//}
