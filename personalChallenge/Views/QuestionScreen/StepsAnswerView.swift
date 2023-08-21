//
//  StepsAnswerView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 21/08/23.
//

import SwiftUI

struct StepsAnswerView: View {
    
     @Binding var fractionSolutions: FractionSolutions
     @Binding var Soal: soal
     @Binding var jawaban: Jawaban
     @Binding var stepOneDone: Bool
     @Binding var stepTwoDone: Bool
     @Binding var stepThreeDone: Bool
     @Binding var stepSimplify: Bool
     @Binding var isDisabledStep1: Bool
     @Binding var isDisabledStep2: Bool
     @Binding var isDisabledStep3: Bool
     @Binding var isDisabledStepSimplify: Bool
     @Binding var operand: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        
            if !fractionSolutions.isDenominatorEqual{
                // stepOneDone -> samakan penyebut
                // stepTwoDone -> hasil kali dari samakan penyebut
                // stepThreeDone -> hasil jumlah/kurang pecahan dari samakan penyebut
                //stepFourDone -> kalau bisa di sederhanakan
               
                    EqualizationStepView(Soal: $Soal, jawaban: $jawaban, operand: $operand, isDisabledStep1: $isDisabledStep1)
                
                if stepOneDone {
                    EqualizationResultStepView(jawaban: $jawaban, operand: $operand, isDisabledStep2: $isDisabledStep2)
                    
                }
                
                if stepTwoDone {
                    CalculationStepView(jawaban: $jawaban, operand: $operand, isDisabledStep3: $isDisabledStep3)
                }
                // nanti disini dicek kalau dia bisa disederhanakan
                
                if stepThreeDone && fractionSolutions.canBeSimplified {
                   
                    SimplifyFractionStepView(Soal: $Soal, jawaban: $jawaban, operand: $operand, isDisabledStepSimplify: $isDisabledStepSimplify)
                }
                if stepSimplify && fractionSolutions.canBeSimplified{
                    
                    SimplifyResultStepView(jawaban: $jawaban)
                }
                
            }
            else{
                // kalau dia penyebutnya sama tidak perlu step satu dan dua langsung done aja
                // insert nilai numerator
                
               Step1View(Soal: $Soal, jawaban: $jawaban, operand: $operand,  isDisabledStep3: $isDisabledStep3)
                
                if stepThreeDone && fractionSolutions.canBeSimplified {
                    Step2View(jawaban: $jawaban, isDisabledStepSimplify: $isDisabledStepSimplify)                                }
                if stepSimplify && fractionSolutions.canBeSimplified{
                    Step3View(jawaban: $jawaban)
                    
                }
            }
        }
    }


//struct StepsAnswerView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepsAnswerView()
//    }
//}
