//
//  HomeView.swift
//  03-GetStartedScreenWithParallax
//
//  Created by Armstrong on 06/09/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var inOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Text("HOME").font(.largeTitle)
            Button(action: {
                inOnboardingViewActive = true
            }, label: {
                Text("Restart")
            })
        } //: VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
