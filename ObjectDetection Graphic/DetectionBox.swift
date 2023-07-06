//
//  DetectionBox.swift
//  GraphicTest1
//
//  Created by Yohey Kuwabara on 2022/10/11.
//

import SwiftUI

struct DetectionBox: View{
    @ObservedObject var model: DetectionViewModel
    
    @Binding var infoNum: Int
    
    ///var info: info
    var body: some View {
        VStack(alignment: .leading){
            if model.seeDetails{
                if model.detailPic != " "{
                    ///Image(model.detailPic)
                        ///.resizable()
                        ///.scaledToFit()
                        ///.cornerRadius(model.cornerR)
                        ///.shadow(radius: 5)
                        ///.frame(width: model.boxWidth)
                }
            }
            
            TextBox(model: model, infoNum: $infoNum)
            
            if model.seeDetails == false{
                BoundingBox(model: model)
            }
        }
        
    }
}

struct TextBox: View{
    @ObservedObject var model: DetectionViewModel
    
    @Binding var infoNum: Int
    
    var nameFont: Font = .body
    
    var body: some View{
        //Text view
        VStack(alignment: .leading){
            if model.seeDetails{
                HStack(alignment: .top){
                    
                    Spacer()
                    Button(action: {
                        model.shrinkDetail(info: model.infos[infoNum])
                    }){
                        Image(systemName: "multiply.circle.fill")
                            .font(.title)
                        ///.foregroundColor(.primary)
                            .foregroundColor(model.borderColor)
                        
                    }
                }
                Image(model.detailPic)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(model.cornerR)
                    .shadow(radius: 5)
            }
            //Title
            HStack{
                Text("\(model.name)")
                    .font(model.nameFont)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .lineLimit(1)
                    .foregroundColor(model.borderColor)
                ///GlowingText(text: model.name, font: model.nameFont, textColor: model.borderColor, weight: .bold)
                
                if model.seeDetails{
                    
                }
            }
            //detail
            if model.seeDetails{
                ScrollView{
                    ///GlowingText(text: model.discription, font: .body, textColor: model.borderColor, weight: .regular)
                    Text(model.discription)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(model.borderColor)
                }
                ///.frame(maxHeight: model.boxWidth)
            }
        }
        .padding()
        ///.frame(width: model.boxWidth)
        .background(.ultraThinMaterial)
        .cornerRadius(model.cornerR)
        .shadow(radius: 5)
    }
}

struct BoundingBox: View{
    @ObservedObject var model: DetectionViewModel
    
    let lineWidth : CGFloat = 5
    let shadowR: CGFloat = 10
    
    var body: some View{
        //bounding box
        ZStack{
            RoundedRectangle(cornerRadius: model.cornerR)
                .foregroundColor(.white.opacity(0.3))
                .frame(width: model.boxWidth, height: model.boxHeight)
                .shadow(color: model.borderColor, radius: shadowR)
                .blendMode(.overlay)
            //blur
            RoundedRectangle(cornerRadius: model.cornerR)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(model.borderColor)
                .frame(width: model.boxWidth, height: model.boxHeight)
                .blur(radius: 10)
            //screen blend
            RoundedRectangle(cornerRadius: model.cornerR)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(model.borderColor)
                .frame(width: model.boxWidth, height: model.boxHeight)
                .shadow(color: model.borderColor, radius: shadowR)
                .blendMode(.screen)
            //multiply blend
            RoundedRectangle(cornerRadius: model.cornerR)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(model.borderColor.opacity(0.8))
                .frame(width: model.boxWidth, height: model.boxHeight)
                .shadow(color: model.borderColor, radius: shadowR)
                .blendMode(.multiply)
            
                
        }
    }
}

