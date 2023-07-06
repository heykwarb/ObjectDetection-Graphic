//
//  OakleyKatoDetect.swift
//  GraphicTest1
//
//  Created by Yohey Kuwabara on 2022/10/11.
//

import SwiftUI

class DetectionViewModel: ObservableObject{
    @Published var seeDetails = false
    
    //whole screen size
    @Published var viewWidth = CGFloat.zero
    @Published var viewHeight = CGFloat.zero
    
    @Published var name: String = ""
    @Published var discription:String = ""
    
    @Published var nameFont: Font = .caption
    
    @Published var detailPic: String = ""
    
    @Published var title: String = ""
    @Published var caption1: String = ""
    
    @Published var boxWidth: CGFloat?
    @Published var boxHeight: CGFloat?
    
    @Published var maxWidth: CGFloat?
    @Published var maxHeight: CGFloat?
    
    @Published var positionX: CGFloat = 0
    @Published var positionY: CGFloat = 0
    
    @Published var scale = 1.0
    
    @Published var borderColor: Color = .blue
    
    @Published var bgImage: String = ""
    
    @Published var blurR: CGFloat = 0
    
    @Published var animation = true
    
    ///@Published var infoNum: Int = 0
    
    let cornerR: CGFloat = 20
    
    let repeated = Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)
    
    @Published var infos: [info] = [
        info(id: 0, seeDetails: false, name: "Jony Ive", discription: "Former Chief Design Officer ar Apple. Now he is a head of independent firm named LoveFrom, along with Marc Newson", detailPic: " ", title: "Virgil Abloh & Jony Ive", caption1: "", boxWidth: 100, boxHeight: 120, positionX: 140, positionY: 275, bgImage: "Virgil&Jony", borderColor: .blue),
        info(id: 1, seeDetails: false, name: "Virgil Abloh", discription: "Virgil Abloh (September 30, 1980 – November 28, 2021) was an American fashion designer and entrepreneur. He was the artistic director of Louis Vuitton's menswear collection beginning in 2018, and was given increased creative responsibilities across the LVMH brand in early 2021", detailPic: " ", title: "", caption1: "", boxWidth: 90, boxHeight: 110, positionX: 270, positionY: 220, bgImage: "Virgil&Jony", borderColor: .blue),
        info(id: 2, seeDetails: false, name: "Oakley Kato", discription: "Oakley Kato is engineered to push the boundaries of performance with a purpose-built design that conforms to the contours of the face for a seamless look. With its progressive, disruptive wrap design, the frameless architecture, innovative tilt function, and multiple nosepads create a customized fit. Paired with Prizm Lens Technology, Oakley Kato empowers athletes with optimized coverage and an expanded field of view.", detailPic: "oakleyKato1", title: "Steve Lacy x Oakley Kato", caption1: "Top FM 669 Sunglasses OAKLEY Necklace BULGARI HIGHSNOBIETY / TOM KNELLER", boxWidth: 160, boxHeight: 80, positionX: 220, positionY: 250, bgImage: "S.Lacy x Oakley Kato", borderColor: .red),
        info(id: 3, seeDetails: false, name: "Nike Epic Shortpack", discription: "Designed and developed to be the most innovative backpack blending; automotive styling, hard shell protection, flexible joints and ergonomics.", detailPic: "IMG_7240", title: "Nike Epic Shortpack", caption1: "Design by Phill Frank Design", boxWidth: 200, boxHeight: 300, positionX: 210, positionY: 420, bgImage: "IMG_7233", borderColor: .orange),
        info(id: 4, seeDetails: false, name: "Hamcus EMCT JACKET", discription: "_HOOD CONCEALED IN ZIP POCKET AT BACK OF STAND COLLAR WITH DRAWSTRING ADJUSTER._A PARATROOPER ADJUSTER WITH ADJUSTABLE COLLAR IS FITTED IN THE METAL EYELETS ON BOTH SIDES OF THE LOWER NECK._HAND POCKET & THREE CONCEALED ZIP POCKETS ON LEFT CHEST COMBINATION PANEL._HAND POCKET & CARGO ZIP POCKET & VELCRO FLAP POCKET ON RIGHT CHEST COMBINATION PANEL._BUCKLE ADJUSTMENT SLIDE ON CHEST._COLLAR IS ZIP-DETACHABLE FOR A VARIETY OF WEARING CONFIGURATIONS._DETACHABLE SANDWORM SLEEVES WITH ZIP AND SNAP BUTTONS._2 CONCEALED ZIPPERED SEE-THROUGH NYLON MESH POCKETS AT BACK WAIST._DETACHABLE HD SEE-THROUGH NYLON MESH POCKET BACK PANEL._ELEMENTS ASSOCIATED WITH THE LP WORLD ARE PRINTED THROUGHOUT.", detailPic: "Hamcus EMCT JACKET", title: "Hamcus EMCT JACKET", caption1: "_FABRIC 1: 60% COTTON, 40% NYLON /_FABRIC 2: 100% NYLON", boxWidth: 140, boxHeight: 180, positionX: 210, positionY: 280, bgImage: "Hamcus EMCT JACKET", borderColor: .blue),
        info(id: 5, seeDetails: false, name: "MM6 x Salomon Vest", discription: "Collaboration between MM6 Maison Margiela and Salmon, revealed in Milan Fashion Week Spring/Summer 2023", detailPic: "", title: "", caption1: "", boxWidth: 280, boxHeight: 340, positionX: 210, positionY: 420, bgImage: "IMG_7519", borderColor: .pink),
        info(id: 6, seeDetails: false, name: "Arc'teryx Gamma LT Hoody", discription: "Versatility is freedom. Inspired by British Columbia’s range of terrain, environments and conditions, the Gamma LT Hoody is an essential softshell for anyone seeking new places and experiences. Wind and weather resistant, the lightweight softshell fabric stretches and breathes. The fit is streamlined, allows room for light layers, and is patterned for freedom of movement. A helmet compatible StormHood™ delivers full coverage without impacting peripheral vision.", detailPic: "", title: "", caption1: "", boxWidth: 350, boxHeight: 450, positionX: 210, positionY: 420, bgImage: "Gamma-LT-Hoody-Black-Sapphire", borderColor: .blue)
    ]
    
    func setUp(size: CGSize, info: info){
        viewWidth = size.width
        viewHeight = size.height
        
        withAnimation(){
            update(info: info)
        }
        
        withAnimation(repeated) {
            scale = 1.1
        }
    }
    
    func update(info: info){
        withAnimation(){
            name = info.name
            discription = info.discription
            detailPic = info.detailPic
            title = info.title
            caption1 = info.caption1
            
            positionX = info.positionX
            positionY = info.positionY
            
            boxWidth = info.boxWidth
            boxHeight = info.boxHeight
            
            maxWidth = viewWidth/1.2
            maxHeight = viewHeight/2
            
            bgImage = info.bgImage
           
            borderColor = info.borderColor
        }
    }
    
    func expandDetail(info: info){
        print("detailPic \(detailPic)")
        withAnimation(){
            seeDetails = true
            print("seeDetails \(seeDetails)")
            
            boxWidth = viewWidth/1.2
            boxHeight = viewHeight/2
            
            positionX = viewWidth/2
            positionY = viewHeight/2
            
            blurR = 20
            nameFont = .title
            
            scale = 1
        }
    }
    
    func shrinkDetail(info: info){
        withAnimation(){
            seeDetails = false
            print("seeDetails \(seeDetails)")
            
            boxWidth = info.boxWidth
            boxHeight = info.boxHeight
            
            positionX = info.positionX
            positionY = info.positionY
            
            blurR = 0
            nameFont = .caption
            
            
        }
        withAnimation(repeated) {
            scale = 1.1
        }
    }
}

struct info: Identifiable{
    var id: Int
    var seeDetails: Bool
    var name: String
    var discription: String
    var detailPic: String
    var title: String
    var caption1: String
    var boxWidth: CGFloat
    var boxHeight: CGFloat
    let positionX: CGFloat
    let positionY: CGFloat
    let bgImage: String
    let borderColor: Color
}
