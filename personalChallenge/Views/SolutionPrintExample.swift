//
//  SolutionPrintExample.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 17/08/23.
//

import SwiftUI

var f1 = generateFraction()
var f2 = generateFraction()



struct SolutionsPrintExample: View {
    
    var fractionSolutions:FractionSolutions
    var soalPecahan:FractionPair
    var operand:String
    var finalSolution = finalAnswer(f1: f1, f2: f2, operand: Operand.plus)
    
    var body: some View {
        VStack {
            HStack {
                VStack{
                    Text("\(soalPecahan.f1.numerator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))

                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 36, height: 2)
                        .padding(.vertical, 4)
                    Text("\(soalPecahan.f1.denominator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                }
                
                Image(systemName: operand)
                    .padding(.horizontal)
                
                VStack{
                    Text("\(soalPecahan.f2.numerator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 36, height: 2)
                        .padding(.vertical, 4)
                    Text("\(soalPecahan.f2.denominator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                }
            }
            
            
            VStack {
                ForEach(0..<fractionSolutions.steps.count+1, id: \.self) {
                    
                    if !fractionSolutions.isDenominatorEqual && $0 == 0 {
                        StepHeading(title: "Langkah 1: Samakan penyebut")
                            .padding(.top, 24)
                       
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 12) {
                                    Text("\(soalPecahan.f1.numerator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    Image(systemName: "multiply")
                                    Text("\((fractionSolutions.steps[0] as! TimesFactors).t1)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 90, height: 2)
                                    .padding(.vertical, 4)
                                
                                HStack(spacing: 12) {
                                    Text("\(soalPecahan.f1.denominator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    Image(systemName: "multiply")
                                    Text("\((fractionSolutions.steps[0] as! TimesFactors).t1)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                            }
                            
                            Image(systemName: operand)
                                .padding(.horizontal)
                            
                            VStack{
                                VStack(spacing: 4) {
                                    HStack(spacing: 12) {
                                        Text("\(soalPecahan.f2.numerator)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                        Image(systemName: "multiply")
                                        Text("\((fractionSolutions.steps[0] as! TimesFactors).t2)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                    }
                                    
                                    Image(systemName: "minus")
                                        .resizable()
                                        .frame(width: 90, height: 2)
                                        .padding(.vertical, 4)
                                    
                                    HStack(spacing: 12) {
                                        Text("\(soalPecahan.f2.denominator)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                        Image(systemName: "multiply")
                                        Text("\((fractionSolutions.steps[0] as! TimesFactors).t2)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                    }
                                }
                            }
                        }
                    }
                    
                    if !fractionSolutions.isDenominatorEqual && $0 == 1 {
                        StepHeading(title: "Langkah 2: Hitung operasi aritmatika pecahan")
                            .padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                Text("\((fractionSolutions.steps[1] as! FractionPair).f1.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                              
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                
                                Text("\((fractionSolutions.steps[1] as! FractionPair).f1.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                            
                            Image(systemName: operand)
                                .padding(.horizontal)
                            
                            VStack(spacing: 4) {
                                Text("\((fractionSolutions.steps[1] as! FractionPair).f2.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                              
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                
                                Text("\((fractionSolutions.steps[1] as! FractionPair).f2.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                            
                        }
                    }
                    
                    if !fractionSolutions.isDenominatorEqual && fractionSolutions.canBeSimplified && $0 == 2 {
                        StepHeading(title: "Langkah 3: Sederhanakan pecahan")
                            .padding(.top, 24)
                        
                        HStack (spacing: 12) {
                            VStack(spacing: 4) {
                                HStack(spacing: 12) {
                                    Text("\((fractionSolutions.steps[3] as! SimplifyProperties).operationResult.numerator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((fractionSolutions.steps[3] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 90, height: 2)
                                    .padding(.vertical, 4)
                                
                                HStack(spacing: 12) {
                                    Text("\((fractionSolutions.steps[3] as! SimplifyProperties).operationResult.denominator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((fractionSolutions.steps[3] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                            }
                        }
                    }

                    if !fractionSolutions.isDenominatorEqual && !fractionSolutions.canBeSimplified && $0 == 2 {
                        StepHeading(title: "Langkah 3: Hasil akhir")
                            .padding(.top, 24)
                        
 
                        VStack(spacing: 4) {
                            Text("\((fractionSolutions.steps[2] as! FinalAnswer).operationResult.numerator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))

                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 36, height: 2)
                                .padding(.vertical, 4)

                            Text("\((fractionSolutions.steps[2] as! FinalAnswer).operationResult.denominator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))
                        }
                        
                    }

                    if !fractionSolutions.isDenominatorEqual && fractionSolutions.canBeSimplified && $0 == 3 {
                        StepHeading(title: "Langkah 4: Hasil akhir")
                            .padding(.top, 24)
                        
                        VStack(spacing: 4) {
                            Text("\((fractionSolutions.steps[3] as! SimplifyProperties).result.numerator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))

                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 36, height: 2)
                                .padding(.vertical, 4)

                            Text("\((fractionSolutions.steps[3] as! SimplifyProperties).result.denominator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))
                        }
                        
                    }
                    
                    if fractionSolutions.isDenominatorEqual && $0 == 0 {
                        StepHeading(title: "Langkah 1: Samakan penyebut")
                        
                        HStack {
                            VStack{
                                Text("\(soalPecahan.f1.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                Text("\(soalPecahan.f1.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                            
                            Image(systemName: operand)
                                .padding(.horizontal)
                            
                            VStack{
                                Text("\(soalPecahan.f2.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                Text("\(soalPecahan.f2.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                        }
                    }
                    
                    if fractionSolutions.isDenominatorEqual && fractionSolutions.canBeSimplified && $0 == 1 {
                        StepHeading(title: "Langkah 2: Sederhanakan pecahan")
                            .padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 2) {
                                    Text("\((fractionSolutions.steps[2] as! SimplifyProperties).operationResult.numerator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((fractionSolutions.steps[2] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                
                                HStack(spacing: 2) {
                                    Text("\((fractionSolutions.steps[2] as! SimplifyProperties).operationResult.denominator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((fractionSolutions.steps[2] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
         
                                }
                            }
                        }
                    }
                    
                    if fractionSolutions.isDenominatorEqual && !fractionSolutions.canBeSimplified && $0 == 1 {
                        StepHeading(title: "Langkah 3: Hasil akhir")
                            .padding(.top, 24)
                        
                        VStack(spacing: 4) {
                            Text("\((fractionSolutions.steps[1] as! FinalAnswer).operationResult.numerator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))

                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 36, height: 2)
                                .padding(.vertical, 4)

                            Text("\((fractionSolutions.steps[1] as! FinalAnswer).operationResult.denominator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))
                        }
                        
                    }
                    
                    if fractionSolutions.isDenominatorEqual && fractionSolutions.canBeSimplified && $0 == 2 {
                        StepHeading(title: "Langkah 3: Hasil akhir")
                            .padding(.top, 24)
                        
                        VStack(spacing: 4) {
                            Text("\((fractionSolutions.steps[2] as! SimplifyProperties).result.numerator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))

                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 36, height: 2)
                                .padding(.vertical, 4)

                            Text("\((fractionSolutions.steps[2] as! SimplifyProperties).result.denominator)")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("NavyText"))
                        }
                    }
                }
            }
        }
    }
}

struct SolutionsPrintExample_Previews: PreviewProvider {
    static var previews: some View {
        SolutionsPrintExample(
            fractionSolutions:
                (FractionSolutions(
                    steps: [], // Provide the actual array of steps here
                    isDenominatorEqual: true, // Provide the actual boolean value here
                    canBeSimplified: true
            )),
            soalPecahan: (FractionPair(
                f1: (numerator: 3, denominator: 4, decimal: 0.75),
                f2: (numerator: 1, denominator: 2, decimal: 0.5))),
            operand: "plus")
    }
}

