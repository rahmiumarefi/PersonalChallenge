//
//  QuestionScreen.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 17/08/23.
//

import SwiftUI
import Combine

struct QuestionScreen: View {
    @State private var jawaban = Jawaban()
    @State private var isStepMode = false
    @State private var isCheck = false
    @State private var isCorrect = false
    @State private var showAlert = false
    @State private var showWrongAlert = false
    @State private var stepOneDone:Bool = false
    @State private var stepTwoDone = false
    @State private var stepThreeDone = false
    @State private var stepSimplify = false
    @State private var isDisabledStep1 = false
    @State private var isDisabledStep2 = false
    @State private var isDisabledStep3 = false
    @State private var isDisabledStepSimplify = false
    @State private var isPresented = true
    @State private var setting:QuestionType
    @State private var Soal:soal
    @State private var fractionSolutions:FractionSolutions
    @State var operand:String
    @State var isGoToReviewPage:Bool = false
    @State private var keyboardHeight: CGFloat = 0
    
    @FocusState var isFocused
    
    init() {
        let settingku = QuestionType(isBilangan: true,isCerita: false,isGambar: true)
        let soalku = generateSoal(setting: settingku)
        let solusi = generateSolutionSteps(f1: soalku.fractionPair.f1, f2: soalku.fractionPair.f2, operand: soalku.operand)
        setting = settingku
        Soal = soalku
        fractionSolutions = solusi
        operand = soalku.operand.rawValue
        print(fractionSolutions.canBeSimplified)
        
        
    }
    
    var body: some View {
        if !isGoToReviewPage {
            VStack {
                VStack {
                    HStack {
                   
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 27, height: 27)
                                .foregroundColor(Color("NavyText"))
                        }.sheet(isPresented: $isPresented){
                            SettingScreen(isPresented: $isPresented, setting:$setting)
                        }
                        
                        Spacer()
   
                        
                        Text ("Soal")
                            .foregroundColor(Color("NavyText"))
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                        
                        Spacer()
                    
                        Button{
                            showAlert.toggle()
                        }label:{
                           
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("NavyText"))
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Apakah kamu ingin menyerah?"),
                                
                                primaryButton: .default(
                                    Text("Ya")
                                    ,action:{
                                        isGoToReviewPage.toggle()
                                    }
                                ),
                                secondaryButton: .destructive(
                                    Text("Tidak"))
                            )
                        }
                    }.padding(.horizontal, 32)
                    
                    
                    VStack {
                        if(Soal.questionType == .cerita){
                            Text(.init(Soal.soalCerita!))
                                .font(.system(size: 18,weight: .regular, design: .rounded))
                                .lineSpacing(8)
                                .foregroundColor(.white)
                                .padding(.all, 24)
                            
                        }
                        else if(Soal.questionType == .bilangan){
                            SoalPecahan(fraction: $Soal.fractionPair,operand:$operand)
                        }
                        else if(Soal.questionType == .gambar){
                            SoalGambar(fraction: $Soal.fractionPair,operand:$operand)
                        }
                        
                    }
                    .frame(maxWidth:.infinity)
                    .frame(height:270)
                    .background(Color ("PurpleLight"))
                    .cornerRadius(20)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 24)
                    .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)
                    .onChange(of: isPresented || isGoToReviewPage) { newValue in
                        
                        if !newValue {
                            
                            let settingGenerate = QuestionType(isBilangan: setting.isBilangan,isCerita: setting.isCerita,isGambar: setting.isGambar)
                            let soalGenerate = generateSoal(setting: settingGenerate)
                            let solusiGenerate = generateSolutionSteps(f1: soalGenerate.fractionPair.f1, f2: soalGenerate.fractionPair.f2, operand: soalGenerate.operand)
                            let operasi = soalGenerate.operand.rawValue
                            
                            
                            setting = settingGenerate
                            Soal = soalGenerate
                            fractionSolutions = solusiGenerate
                            operand = operasi
                            jawaban = Jawaban()
                            stepTwoDone = false
                            stepOneDone = false
                            stepThreeDone = false
                            stepSimplify = false
                            isDisabledStep1 = false
                            isDisabledStep2 = false
                            isDisabledStep3 = false
                            isDisabledStepSimplify = false
                            isStepMode = false
                            print(fractionSolutions.canBeSimplified)
                            if(solusiGenerate.isDenominatorEqual){
                                stepOneDone.toggle()
                                stepTwoDone.toggle()
                                
                            }
                        }
                        
                    }
                    
                    
                    
                        Text ("Jawaban")
                            .foregroundColor(Color("OrangeText"))
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(.leading, -165.0)
                        
                        
                   
                    
                    if isStepMode {
                        ScrollView {
                            StepsAnswerView( fractionSolutions: $fractionSolutions, Soal: $Soal, jawaban: $jawaban, stepOneDone: $stepOneDone, stepTwoDone: $stepTwoDone, stepThreeDone: $stepThreeDone, stepSimplify: $stepSimplify, isDisabledStep1: $isDisabledStep1, isDisabledStep2: $isDisabledStep2, isDisabledStep3: $isDisabledStep3, isDisabledStepSimplify: $isDisabledStepSimplify, operand: $operand)
                        }
                    } else {
                        
                       DirectAnswerView(jawaban: $jawaban)
                            .focused($isFocused)
                            
                    }
                    
                    HStack {}.padding(.bottom, keyboardHeight)
                }
                
                .onReceive(Publishers.keyboardHeight) {
                    self.keyboardHeight = $0 - 150.0
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isStepMode = !isStepMode
                    } label: {
                        if isStepMode {
                            Text ("LANGSUNG")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(3)
                                .foregroundColor(Color ("OrangeText"))
                        } else {
                            Text ("TAHAPAN")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color ("OrangeText"))
                        }
                    }
                    .frame(maxWidth: 168, maxHeight: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("OrangeDark"), lineWidth: 2)
                    )
                    .background(.white)
                    .cornerRadius(30)
                    .padding(.bottom, 32)
                    
                    Spacer()
                    
                    
                    Button {
                        if isStepMode {
                            isCheck = !isCheck
                            if !fractionSolutions.isDenominatorEqual{
                                if !stepOneDone {
                                    jawaban = checkEqualizeFraction(fractionSolutions: fractionSolutions, jawaban:jawaban)
                                    if(jawaban.isCheckEqualize){
                                        print("masuk")
                                        stepOneDone = !stepOneDone
                                        isDisabledStep1.toggle()
                                        
                                    }
                                }
                                else if stepOneDone && !stepTwoDone{
                                    jawaban = checkCalculationTimesFactor(fractionSolutions: fractionSolutions, jawaban:jawaban)
                                    if(jawaban.isCheckCalculationTimesFactor){
                                        print("masuk")
                                        stepTwoDone = !stepTwoDone
                                        isDisabledStep2.toggle()
                                    }
                                    
                                }
                                // sekalian cek kalau dia gabisa di simplified lagi pindah ke review
                                else if stepTwoDone && !stepThreeDone{
                                    jawaban = checkCalculationFraction(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                   
                                    if(jawaban.isCheckCalculation){
                                        stepThreeDone = !stepThreeDone
                                        isDisabledStep3.toggle()
                                     
                                        if(!fractionSolutions.canBeSimplified){
                                            isGoToReviewPage.toggle()
                                            print("selesai pindah ke review")
                                            
                                        }else{
                                            
                                        }
                                        
                                    }
                                    
                                }
                                else  if stepThreeDone && !stepSimplify && fractionSolutions.canBeSimplified{
                                    
                                    // pindah ke review
                                    jawaban = checkSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban)
                                    if jawaban.isCheckSimplified{
                                        print("masuk")
                                        stepSimplify.toggle()
                                        isDisabledStepSimplify.toggle()
                                        
                                    }
                                    
                                    // ke review screen
                                    
                                }
                                
                                else if stepSimplify{
                                    // pindah ke review
                                    jawaban = checkFinalAnswerSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if jawaban.isCheckFinalAnswerSimplified{
                                        print("hasil akhir  udah di simplify")
                                        isGoToReviewPage.toggle()
                                    }
                                    else{
                                        print("gamasuk gagal hasil akbir")
                                    }
                                }
                            }
                            else{
                                if !stepThreeDone{
                                    jawaban = checkCalculationFraction(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if(jawaban.isCheckCalculation){
                                        stepThreeDone = !stepThreeDone
                                        
                                        // pindah ke revie
                                        if(!fractionSolutions.canBeSimplified){
                                            print("kelar gaada simplify")
                                    
                                            isGoToReviewPage.toggle()
                                            
                                        }
                                        print("masuk")
                                    }
                                    
                                }
                                else if stepThreeDone && !stepSimplify && fractionSolutions.canBeSimplified{
                                    
                                    
                                    jawaban = checkSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban)
                                    if jawaban.isCheckSimplified{
                                        print("masuk")
                                        stepSimplify.toggle()
                                    }
                                    else{
                                        print("gamasuk")
                                    }
                                    // ke review screen
                                    
                                }
                                
                                else if stepSimplify{
                                    // pindah ke review
                                    jawaban = checkFinalAnswerSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if jawaban.isCheckFinalAnswerSimplified{
                                        isGoToReviewPage.toggle()
                                        print("hasil akhir  udah di simplify")
                                    }
                                    else{
                                        print("gamasuk gagal hasil akbir")
                                    }
                                }
                            }
                        } else{
                            if fractionSolutions.canBeSimplified{
                                jawaban = checkFinalAnswerSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode:isStepMode)
                                if jawaban.isCheckFinalAnswerSimplified{
                                    isGoToReviewPage.toggle()
                                    print("hasil akhir  udah di simplify pindah ke review")
                                }
                                else{
                                    print("gamasuk gagal hasil akbir")
                                }
                            }else if !fractionSolutions.canBeSimplified{
                                jawaban = checkCalculationFraction(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                if(jawaban.isCheckCalculation){
                                    // pindah ke review
                                    // atau tambah alert lagi??
                                    if(!fractionSolutions.canBeSimplified){
                                        isGoToReviewPage.toggle()
                                        print("selesai pindah ke review")
                                        
                                    }
                                }
                            }
                        }
                        
                    } label: {
                        
                        if isStepMode && stepTwoDone && !fractionSolutions.canBeSimplified || stepSimplify {
                            Text ("JAWAB")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        else if isStepMode && !stepThreeDone || stepThreeDone && fractionSolutions.canBeSimplified {
                            Text ("CEK")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        else {
                            Text ("JAWAB")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                    }
                    .frame(maxWidth: 168, maxHeight: 48)
                    .background(LinearGradient(colors: [Color("OrangeLight"), Color("OrangeDark")], startPoint: .top, endPoint: .bottom))
                    .cornerRadius(30)
                    .padding(.bottom, 32)
                    .navigationDestination(isPresented:$isGoToReviewPage){
                        
                        ReviewScreen(fractionSolutions: fractionSolutions, isGoToReviewPage: $isGoToReviewPage,soalPecahan: Soal.fractionPair, operand:operand)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth:.infinity, maxHeight: 130)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: Color ("GrayBlur"), radius: 5, x:0, y:-3)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            .ignoresSafeArea(.all)
            .frame(maxHeight: .infinity)
            .background(.white)
            .padding(.top, 24)
        } else {
            ReviewScreen(fractionSolutions: fractionSolutions, isGoToReviewPage: $isGoToReviewPage, soalPecahan: Soal.fractionPair, operand:operand)
                .navigationBarBackButtonHidden(true)
        }
    }
}


struct QuestionScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        QuestionScreen()
    }
}


