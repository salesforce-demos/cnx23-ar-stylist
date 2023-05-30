//
//  ContentView.swift
//  ar-stylist
//
//  Created by Joe Andolina on 5/29/23.
//

import SwiftUI

struct ContentView: View {
    @State var analysis: String = ""
    
    var body: some View {
        VStack {
            BridgeView(analysis: $analysis)
        }
    }
}

struct BridgeView: UIViewControllerRepresentable {
    @Binding var analysis: String

    func makeUIViewController(context: Context) -> some UIViewController {
        print("BridgeView makeUIViewController")
        
        let storyBoard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil);
        let viewCtl = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController;
        
        print("BridgeView viewCtl", viewCtl)

        viewCtl.reportChange = {
            // print("reportChange")
            analysis = viewCtl.analysis
        }
        return viewCtl
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // print("BridgeView updateUIViewController")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
