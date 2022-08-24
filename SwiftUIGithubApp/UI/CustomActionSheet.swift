//
//  CustomActionSheet.swift
//  SwiftUIGithubApp
//
//  Created by Joshua on 2022/7/5.
//

import SwiftUI

extension Toggle {
    init<T: Hashable>(
        isOn: Binding<T>,
        tag: T,
        @ViewBuilder label: () -> Label
    ){
        
        let selectionValue: Binding<Bool> = Binding(
            get: {
                isOn.wrappedValue == tag
            },
            set: { _ in
                isOn.wrappedValue = tag
            })

        self.init(isOn: selectionValue, label: label)
    }
}

struct CheckboxStyle: ToggleStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
 
    }
}

struct CustomActionSheet: View {
    
    @EnvironmentObject var store: Store
    var selectLanguageBinding: Binding<Language> {
        $store.appState.settings.changer.language
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Toggle(isOn: selectLanguageBinding, tag:Language.en) {
                Text(Language.en.name)
            }
            .toggleStyle(CheckboxStyle())
        
            Toggle(isOn: selectLanguageBinding, tag:Language.zh) {
                Text(Language.zh.name)
            }
            .toggleStyle(CheckboxStyle())
            
            Toggle(isOn: selectLanguageBinding, tag:Language.ja) {
                Text(Language.ja.name)
            }
            .toggleStyle(CheckboxStyle())
            
            Toggle(isOn: selectLanguageBinding, tag:Language.default) {
                Text(Language.default.name)
            }
            .toggleStyle(CheckboxStyle())
            
        }.padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top,20)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(15)
    }
}

struct CustomActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        CustomActionSheet()
    }
}
