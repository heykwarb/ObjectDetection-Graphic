//
//  DetectionView.swift
//  GraphicTest1
//
//  Created by Yohey Kuwabara on 2022/10/10.
//

import SwiftUI



struct DetectionView: View {
    @ObservedObject var model: DetectionViewModel
    
    @State var infoNum: Int = 5
    
    ///@State var info: info?
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                bgView(model: model, infoNum: $infoNum)
                    .blur(radius: model.blurR)
                    .onTapGesture {
                        if model.seeDetails == true{
                            model.shrinkDetail(info: model.infos[infoNum])
                        }
                    }
                    .onChange(of: infoNum){num in
                        
                        model.update(info: model.infos[infoNum])
                        
                    }
                DetectionBox(model: model, infoNum: $infoNum)
                    .scaleEffect(model.scale)
                    .position(x: model.positionX , y: model.positionY-20 )
                    .onTapGesture {
                        if model.seeDetails == false{
                            model.expandDetail(info: model.infos[infoNum])
                        }
                    }
                ///TestView(model: model, infoNum: $infoNum)
                
            }
            .onAppear(){
                model.setUp(size: geo.size, info: model.infos[infoNum])
                
                
            }
        }
    }
}

struct DetectionView_Previews: PreviewProvider {
    static var previews: some View {
        DetectionView(model: DetectionViewModel())
            
    }
}

struct bgView: View{
    @ObservedObject var model: DetectionViewModel
    
    @Binding var infoNum: Int
    
    var body: some View{
        ZStack{
            if model.bgImage != " "{
                Image(model.bgImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: model.viewWidth, height: model.viewHeight)
                    .blur(radius: 20)
            }
            Image(model.bgImage)
                    .resizable()
                    .scaledToFit()
                    ///.padding()
            
            Color.black.opacity(0.2)
                
            VStack{
                HStack(alignment: .top){
                    ///GlowingText(text: model.title, font: .custom("Baskerville", size: 40), textColor: model.borderColor, weight: .bold, textCase: .uppercase)
                        ///.frame(maxWidth: model.viewWidth/2)
                        ///.multilineTextAlignment(.leading)
                    ///
                    VStack(alignment: .leading){
                        GlowingText(text: "infoNum: \(infoNum)", font: .body, textColor: model.borderColor)
                        GlowingText(text: "\(model.name)", font: .body, textColor: model.borderColor)
                        GlowingText(text: "x: \(model.positionX)", font: .body, textColor: model.borderColor)
                        GlowingText(text: "y: \(model.positionY)", font: .body, textColor: model.borderColor)
                    }
                    
                    Spacer()
                    
                    Picker("Picker", selection: $infoNum){
                        ForEach(model.infos){info in
                            Text(model.infos[info.id].name).tag(info.id)
                            
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                HStack(alignment: .bottom){
                    GlowingText(text: model.caption1, font: .caption, textColor: model.borderColor, textCase: .uppercase)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}


struct GlowingText: View{
    var text: String
    var font: Font
    var textColor: Color
    
    var weight: Font.Weight = .regular
    var textCase: Text.Case = .lowercase
     
    var body: some View{
        ZStack{
            Text(text)
                .font(font)
                .fontWeight(weight)
                .textCase(textCase)
                .foregroundColor(textColor)
                .shadow(color: textColor,radius: 3)
                .blendMode(.screen)
            
            Text(text)
                .font(font)
                .fontWeight(weight)
                .textCase(textCase)
                .foregroundColor(textColor.opacity(0.8))
                .shadow(color: textColor,radius: 3)
                .blendMode(.multiply)
        }
    }
}




struct TestView: View{
    @ObservedObject var model: DetectionViewModel
    @State var testInfos = [testInfo(strArray: "testInfo1")]
    @State var testArray = ["testArray1"]
    
    @Binding var infoNum: Int
    
    var body: some View{
        HStack{
            VStack{
                Text("testArray")
                Text(testArray[0])
                Button("button"){
                    testArray[0] = "success"
                }
            }
            VStack{
                Text("testModel")
                Text(testInfos[0].strArray)
                Button("button"){
                    testInfos[0].strArray = "success"
                }
            }
            VStack{
                Text("Model")
                
                Text(model.infos[0].title)
                Button("button"){
                    model.infos[0].title = "success"
                    model.infos[0].seeDetails.toggle()
                    print(model.infos[0].seeDetails)
                    model.update(info: model.infos[infoNum])
                }
            }
        }
        .padding()
        .background(.thinMaterial)
    }
}

struct testInfo: Identifiable{
    var id = UUID()
    var strArray: String
}
