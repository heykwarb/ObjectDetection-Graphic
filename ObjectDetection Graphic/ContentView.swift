//
//  ContentView.swift
//  ObjectDetection Graphic
//
//  Created by Yohey Kuwabara on 2022/10/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = DetectionViewModel()
    var body: some View {
        DetectionView(model: model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
