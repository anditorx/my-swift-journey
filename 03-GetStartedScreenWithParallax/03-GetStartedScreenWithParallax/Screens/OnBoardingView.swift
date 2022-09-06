//
//  OnBoardingView.swift
//  03-GetStartedScreenWithParallax
//
//  Created by Armstrong on 06/09/22.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var inOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20){
                // MARK: - Header
                Spacer()
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                
                // MARK: - Center
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                // MARK: - Footer
                ZStack{
                    // Parts of custom button
                    
                    // 1. Background (Static)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        
                    // 2. Call-to-action (Static)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. Capsule (Dynamic Width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    // 4. Circle (Draggable)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            }
                            .onEnded { _ in
                                if buttonOffset > buttonWidth / 2 {
                                    buttonOffset = buttonWidth - 80
                                    inOnboardingViewActive = false
                                }else{
                                    buttonOffset = 0
                                }
                                
                            }
                    )
                        
                        Spacer()
                    } //: HStack
                } //: Footer
                .frame(width: buttonWidth,height: 80, alignment: .center)
                .padding()
            } //: VStack
        } //: ZStack
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
