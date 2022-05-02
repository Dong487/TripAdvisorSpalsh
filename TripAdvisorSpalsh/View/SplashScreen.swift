//
//  SplashScreen.swift
//  TripAdvisorSpalsh
//
//  Created by DONG SHENG on 2021/12/22.
//

// 手機 dark模式 有 bug
//

import SwiftUI

struct SplashScreen: View {
    
    let fillColor: CGColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
    // Animation Properties 動畫屬性
    // 創建 Bool 的 Array
    @State var animationValue: [Bool] = Array(repeating: false, count: 10)
    
    var body: some View {
        ZStack{
            
            // Home View
            GeometryReader{ proxy in
                let size = proxy.size
                
                Home()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .offset(y: animationValue[7] ? 0 : (size.height + 50))
            }
            
            if !animationValue[8]{
                // Splash Screen
                VStack{
                    ZStack{
         
                        if animationValue[1]{
                            // 右邊的眼睛
                            Circle()
                                .fill(.black)
                                .frame(width: 30, height: 30)
                            // 眨眼動畫 (白色遮罩)
                                .overlay(
                                    Rectangle()
                                        .fill(.white)
                                        .frame(height: animationValue[6] ? nil : 0)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        .padding(.bottom ,5)
                                
                                )
                                .offset(x: animationValue[2] ? 35 : 0)
                        }
                        // 左邊的眼睛
                        Circle()
                            .fill(.black)
                            .frame(width: 30, height: 30)
                            .scaleEffect(animationValue[0] ? 1 : 0 ,anchor: .bottom)
                        // 眨眼動畫 (白色遮罩)
                            .overlay(
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: animationValue[6] ? nil : 0)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                    .padding(.bottom ,5)
                            
                            )
                            .offset(x: animationValue[2] ? -35 : 0)
                        
                        // 2個貓頭鷹眼睛外面的圈圈(+眉毛) + 頭蓋 + 鼻子
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black,lineWidth: 10)
                                .frame(width: 65, height: 65)
                                .overlay(
                                    Image(systemName: "arrowtriangle.forward.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .rotationEffect(.init(degrees: -150 ))
                                        .scaleEffect(CGSize(width: 1.5, height: 1))
                                        .offset(x: -10 ,y: -12)
                                    
                                    ,alignment: .topLeading
                                )
                                .offset(x: -35)
                            
                            Circle()
                                .stroke(Color.black,lineWidth: 10)
                                .frame(width: 65, height: 65)
                                .overlay(
                                    Image(systemName: "arrowtriangle.forward.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .rotationEffect(.init(degrees: -158))
                                        .scaleEffect(CGSize(width: 1.5, height: 1))
                                        .offset(y: -12)
                                    
                                    ,alignment: .topTrailing
                                )
                                .offset(x: 35)
                            
                            
                            // 頭蓋 弧
                            Circle()
                                .trim(from: 0.55, to: animationValue[3] ? 1 : 0)
                                .stroke(Color.black , lineWidth: 9.5)
                                .frame(width: 130, height: 130)
                                .rotationEffect(.init(degrees: -10))
                                .scaleEffect(1.02)
                            
                            // 鼻子
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .offset(y: 35)
                                .scaleEffect(CGSize(width: 1.5, height: 1)) // 依照給的長寬比 縮放
                                .background(
                                    // 填補中間的空隙
                                    Circle()
                                        .fill()
                                        .frame(width: 15, height: 15)
                                        .offset(y: 25)
                                    ,alignment: .top
                                )
                        }
                        .opacity(animationValue[3] ? 1 : 0)
                    }
                    .scaleEffect(animationValue[3] ? 0.75 : 1)
                    .padding()
                    // Making it as drawing group
    //                .drawingGroup()
                    
                    Text("我是一隻醜八怪")
                        .font(.title2.bold())
                        .offset(y: animationValue[5] ? -35 : 0)
                        .opacity(animationValue[5] ? 1 : 0)
                }
                .opacity(animationValue[7] ? 0 : 1)
                // Always light mode 保持 亮模式
                .environment(\.colorScheme, .light)
            }
        }
        .onAppear{
            
            // 1.) 步驟1: 圓變大
            withAnimation(.easeInOut(duration: 0.3)){
                animationValue[0] = true
            }
            
            // 2.) 步驟2: 分裂成 2 個圓 + 頭蓋
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                 animationValue[1] = true
                
                // 分裂成 2 個圓 的Bool
                withAnimation(.easeInOut(duration: 0.4).delay(0.1)){
                    animationValue[2] = true
                }
                
                withAnimation(.easeInOut(duration: 0.3).delay(0.45)){
                    animationValue[3] = true
                }
                // 頭蓋
                withAnimation(.easeInOut(duration: 0.4).delay(0.55)){
                    animationValue[4] = true
                }
                
                // 文字
                withAnimation(.easeInOut(duration: 0.4).delay(0.65)){
                    animationValue[5] = true
                }
                // 眨眼 (閉上)
                withAnimation(.easeInOut(duration: 0.4).delay(0.75)){
                    animationValue[6] = true
                }
                // 眨眼 (張開)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.4).delay(0.6)){
                        animationValue[6] = false
                    }
                    
                    // 動畫結束 接 主畫面
                    withAnimation(.easeInOut(duration: 0.5).delay(0.8)){
                        animationValue[7] = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        animationValue[8] = true
                    }
                }
            }
           
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
