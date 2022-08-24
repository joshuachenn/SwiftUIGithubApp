//
//  EventItemView.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/27.
//

import SwiftUI
import Kingfisher


struct EventItemView: View {
    let evm: EventViewModel
    let needImage: Bool
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if needImage && evm.actionUserAvatar != nil {
                    KFImage(evm.actionUserAvatar)
                        .cancelOnDisappear(true)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                        .onTapGesture {
                            // 跳转到用户页
                            print("hello \(evm.actionUserName!)")
                        }
                }
                
                if evm.actionUserName != nil {
                    Text(evm.actionUserName!)
                        .smallBoldText()
                }
                Spacer()
                if evm.actionTime != nil {
                    Text(evm.actionTime!)
                        .smallSubText()
                        .lineLimit(1)
                }
            }
            
            if evm.actionName?.count != 0 {
                Text(evm.actionName!)
                    .smallBoldText()
                    .frame(alignment: .topLeading)
                    .padding(.bottom, 2.0)
            }
            
            if evm.actionDesc?.count != 0 {
                Text(evm.actionDesc!)
                    .smallSubText()
                    .lineLimit(3)
                    .frame(alignment: .topLeading)
            }
        }
    }
    
}

struct EventItemView_Previews: PreviewProvider {
    static var previews: some View {
        EventItemView(evm: EventViewModel.sample(), needImage: true)
    }
}
