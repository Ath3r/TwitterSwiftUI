//
//  FilterButtonView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI


enum TweetFilerOptions: Int, CaseIterable{
    case tweets
//    case replies
    case likes
    
    var title:String{
        switch self{
        case .tweets:
           return "Tweets"
//        case .replies:
//          return  "Tweets & Replies"
        case .likes:
          return  "Likes"
        }
    }
}

struct FilterButtonView: View {
    
    
    @Binding var selectedOption: TweetFilerOptions
    
    

    
    private var underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilerOptions.allCases.count)
    
    private var padding: CGFloat{
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFilerOptions.allCases.count)
        return (((UIScreen.main.bounds.width / count) * rawValue) + 16)
    }
    
    init(option: Binding<TweetFilerOptions>) {
        self._selectedOption = option
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ForEach(TweetFilerOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }){
                        Text(option.title)
                            .frame(width: underlineWidth - 8)
                    }
                    
                }
                
            }
            
            Rectangle()
                .frame(width: underlineWidth - 24, height: 3)
                .foregroundColor(.blue)
                .padding(.leading,padding)
                .animation(.spring())
        }
    }
}
