//
//  SettingView.swift
//  personalChallenge
//
//  Created by Rahmi Umarefi on 11/08/23.
//

import SwiftUI

struct SettingScreen: View {
        @Binding var isPresented:Bool
        @Binding var setting:QuestionType
        @State var isShowingAlert = false
        
        var body: some View {
            ZStack {
                VStack (spacing:50) {
                    Spacer()
                    VStack {
                        Image("LionSmile")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                        //                        .background(.red)
                        Text("FRACTICE")
                            .font(.system(size: 26))
                            .foregroundColor(Color("OrangeLight"))
                            .fontWeight(.heavy)
                            .tracking(5)
                            .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
                    }
                    //                .background(.yellow)
                    .frame(maxWidth:.infinity,maxHeight: 200)
                    
                    VStack{
                        Text("Pilih Tipe Soal Pecahan !")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("OrangeDark"))
                            .padding(.bottom,40)
                        
                        ModeSoal(vibrate: $setting.isBilangan,title:"Soal Bilangan Pecahan",setting:$setting)
                        
                        
                        ModeSoal(vibrate: $setting.isCerita,title:"Soal Cerita Pecahan",setting:$setting)
                        
                        
                        ModeSoal(vibrate: $setting.isGambar,title:"Soal Gambar Pecahan",setting:$setting)
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .edgesIgnoringSafeArea(.bottom)
                .frame( maxHeight: .infinity)
                .background(Color("PurpleLight"))
                
            }
        }}
    
    struct SettingScreen_Previews: PreviewProvider {
        static var previews: some View {
            SettingScreen(isPresented: .constant(false),setting: .constant(QuestionType(isBilangan: true,isCerita: false,isGambar: false)))
        }
    }

