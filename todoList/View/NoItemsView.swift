//
//  NoItemsView.swift
//  todoList
//
//  Created by Mac on 17/07/2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var isAnimate: Bool = false
    let secondaryColor = Color("secondaryColor")
    let mainColor = Color("AccentColor")
    var body: some View {
        ScrollView(content: {
            VStack(spacing: 10 , content: {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to tpur todo list!")
                    .padding(.bottom , 20)
                   NavigationLink(destination:
                                    AddListITem(),
                                  label: {
                       Text("Add Something 😇")
                           .foregroundColor(.white)
                           .font(.headline)
                           .frame(height: 55)
                           .frame(maxWidth: .infinity)
                           .background(isAnimate ? secondaryColor : mainColor)
                           .cornerRadius(10)
                           .shadow(
                            color: isAnimate ? secondaryColor.opacity(0.7) : mainColor.opacity(0.7),
                            radius: isAnimate ? 50 : 30,
                           x: 0,
                            y: isAnimate ? 50 : 0
                           )
                   })
                   .padding(.horizontal , isAnimate ? 30 : 50)
                   .scaleEffect(isAnimate ? 1.1 : 1.0)
                   .offset(y: isAnimate ? -7 : 0)
            })
            .multilineTextAlignment(.center)
//            .frame(minWidth: 400)
            .padding(30)
            .onAppear(perform: addAnimateion)
        })
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
    
    func addAnimateion(){
        guard !isAnimate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ){
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                isAnimate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
