//
//  SplashScreen.swift
//  mile
//
//  Created by Mashael Abdulrahman on 12/05/1445 AH.
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var isPresented: Bool
    @State private var Scale = CGSize(width: 0.8, height: 0.8)
    @State private var imageOpacity = 1.0
    @State private var Opacity = 1.0
    
    
    var body: some View {
        ZStack{
            Color("gray").ignoresSafeArea()
            
            ZStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .opacity(imageOpacity)
                    .frame(width: 300,height: 300)
                    .offset(x:1)
                
            }.scaleEffect(Scale)
            
            
        }.opacity(Opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 2)) {
                    Scale = CGSize(width: 1, height: 1)
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+2.5, execute:{
                    withAnimation(.easeIn(duration: 0.35)){
                        Scale = CGSize(width: 50, height: 50)
                        Opacity = 0
                        
                    }
                    
                    
                })
           
                DispatchQueue.main.asyncAfter(deadline: .now()+2.9, execute:{
                    withAnimation(.easeIn(duration: 0.2)){
                        isPresented.toggle()
                        
                    }
                    
                    
                })
                
            }
    }
}


#Preview {
    SplashScreen(isPresented: .constant(true))
}
