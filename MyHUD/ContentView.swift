//
//  ContentView.swift
//  MyHUD
//
//  Created by Edward A. Barber on 7/7/21.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        ARViewContainer().ignoresSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let sphere = MeshResource.generateSphere(radius: 0.02)
        let material = SimpleMaterial()
        let sphereModel = ModelEntity(mesh: sphere, materials: [material])
        
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.addChild(sphereModel)
        cameraAnchor.transform.translation = [-0.3, 0.5, -2.5]
        
        arView.scene.anchors.append(cameraAnchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
