//
//  QuestionScreenVM.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 14/08/23.
//

import Foundation

//class QuestionScreenModel: ObservableObject {
//    
//    @Published var jawaban = Jawaban()
//    @Published var isStepMode = false
//    @Published var isCheck = false
//    @Published var isCorrect = false
//    @Published var showAlert = false
//    @Published var showWrongAlert = false
//    @Published var stepOneDone:Bool = false
//    @Published var stepTwoDone = false
//    @Published var stepThreeDone = false
//    @Published var stepSimplify = false
//    @Published var isDisabledStep1 = false
//    @Published var isDisabledStep2 = false
//    @Published var isDisabledStep3 = false
//    @Published var isDisabledStepSimplify = false
//    @Published var isPresented = true
//    @Published var setting:QuestionType
//    @Published var Soal:soal
//    @Published var fractionSolutions:FractionSolutions
//    @Published var operand:String
//    @Published var isGoToReviewPage:Bool = false
//    @Published var keyboardHeight: CGFloat = 0
//    
//    init() {
//        let settingku = QuestionType(isBilangan: true,isCerita: false,isGambar: true)
//        let soalku = generateSoal(setting: settingku)
//        let solusi = generateSolutionSteps(f1: soalku.fractionPair.f1, f2: soalku.fractionPair.f2, operand: soalku.operand)
//        setting = settingku
//        Soal = soalku
//        fractionSolutions = solusi
//        operand = soalku.operand.rawValue
//        print(fractionSolutions.canBeSimplified)
//        
//        
//    }
//}
