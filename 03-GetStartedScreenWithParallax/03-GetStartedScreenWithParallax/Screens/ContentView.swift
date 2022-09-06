//
//  ContentView.swift
//  03-GetStartedScreenWithParallax
//
//  Created by Armstrong on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var inOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if inOnboardingViewActive {
                OnBoardingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
