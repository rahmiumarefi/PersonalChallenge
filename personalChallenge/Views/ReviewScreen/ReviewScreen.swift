//
//  ReviewScreen.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 17/08/23.
//

import SwiftUI


struct ReviewScreen: View {
    var fractionSolutions:FractionSolutions
    @Binding var isGoToReviewPage:Bool
    var soalPecahan:FractionPair
    var operand:String
    var body: some View {
            VStack {
                HStack {
                    Text("Ayo Cek Pemahaman Kamu!")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .lineSpacing(5)
                        .foregroundColor(.white)
                        .padding(.vertical, 24)
                        .padding(.leading, 24)
                    
                    Image("LionSmile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96)
                        .padding(.all, 24)
                    
                }
                .frame(maxWidth:.infinity)
                .background(Color ("PurpleLight"))
                .cornerRadius(20)
                .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)
                .padding(.horizontal, 32)
                .padding(.vertical, 24)
                
                ScrollView {
                    // StepWrapper
                    VStack {
                        SolutionsPrintExample(fractionSolutions: fractionSolutions,soalPecahan:soalPecahan,operand:operand)
                        HStack {
                            Spacer()
                            
                           
                            
                            Spacer()
                        }
                       
                        }
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Button {
                            isGoToReviewPage.toggle()
                        } label: {
                            Text("LANJUT")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        .frame(width: 168, height: 48)
                        .background(LinearGradient(colors: [Color("OrangeLight"), Color("OrangeDark")], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30)
                        .padding(.vertical, 10)

                        
                    }
                    .frame(maxWidth:.infinity, maxHeight: 50)
                    .background(.white)
                    .cornerRadius(20)
                }
                .ignoresSafeArea(.all)
                .frame(maxHeight: .infinity)
                .background(.white)
                .padding(.top, 24)
                .padding(.bottom, 5)
        }
    }

//struct ReviewScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewScreen(
//            fractionSolutions: FractionSolutions(),
//            isGoToReviewPage: .constant(false),
//            soalPecahan: FractionPair(),
//            operand: "plus"
//        )
//    }
//}
