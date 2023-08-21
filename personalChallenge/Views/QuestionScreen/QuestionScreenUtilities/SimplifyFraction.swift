//
//  SimplifyFraction.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 16/08/23.
//

import SwiftUI

struct SimplifyFraction: View {
    @Binding var pembilang:String
    @Binding var penyebut:String
    @Binding var pembagi:String
    var isDisabled : Bool = false
    var jawaban : Jawaban
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Text(pembilang)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                    Image(systemName: "divide")
                    StepsAnswerField(inputJawaban: $pembagi,isDisabled: isDisabled,isCorrect: jawaban.isDibagi)
                }
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 130, height: 2)
                    .padding(.vertical, 12)
                
                HStack(spacing: 12) {
                    Text(penyebut)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                    Image(systemName: "divide")
                    StepsAnswerField(inputJawaban: $pembagi,isDisabled: isDisabled,isCorrect: jawaban.isDibagi)
                }
            }
        }
    }
}

struct SimplifyFraction_Previews: PreviewProvider {
    static var previews: some View {
        SimplifyFraction(pembilang: .constant("6"), penyebut: .constant("8"), pembagi: .constant(" "), jawaban: Jawaban())
    }
}
