//
//  DetectionView2.swift
//  ObjectDetection Graphic
//
//  Created by Yohey Kuwa on 2022/11/13.
//

import SwiftUI

struct DetectionView2: View {
    @ObservedObject var model: DetectionViewModel
    
    @State var infoNum: Int = 6
    @State var blurR: CGFloat = 0
    ///@State var info: info?
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                bgView(model: model, infoNum: $infoNum)
                    .onTapGesture {
                        if model.seeDetails == true{
                            ///model.shrinkDetail(info: model.infos[infoNum])
                        }
                    }
                    .onChange(of: infoNum){num in
                        model.update(info: model.infos[infoNum])
                        
                    }
                
                Button(action: {
                    withAnimation(){
                        model.seeDetails = true
                        ///blurR = 10
                        ///model.expandDetail(info: model.infos[infoNum])
                    }
                }){
                    BoundingBox(model: model)
                }
                .scaleEffect(model.scale)
                .position(x: model.positionX, y: model.positionY)
            }
            .blur(radius: blurR)
            .sheet(isPresented: $model.seeDetails, onDismiss: {}) {
                VStack(alignment: .leading){
                    Text("\(model.name)")
                        .font(.custom("Baskerville", size: 28))
                        .fontWeight(.bold)
                        .textCase(.uppercase)
        
                        .foregroundColor(model.borderColor)
                    
                    ScrollView{
                        Text(model.discription)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(.thinMaterial)
                .presentationDetents([.medium])
            }
            .onAppear(){
                model.setUp(size: geo.size, info: model.infos[infoNum])
                
                
            }
        }
    }
}

struct DetectionView2_Previews: PreviewProvider {
    static var previews: some View {
        DetectionView2(model: DetectionViewModel())
    }
}
