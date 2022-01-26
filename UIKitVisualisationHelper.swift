//
//  UIKitVisualisationHelper.swift
//
//  Created by Ankit Yadav on 26/01/22.
//  Copyright © 2022 Ankit Yadav. All rights reserved.

import UIKit
import SwiftUI

struct UIKitViewControllerItem: Identifiable {
    
    var id: String {
        UUID().uuidString
    }
    
    var viewController: UIViewController
    
    init(_viewController: UIViewController) {
        self.viewController = _viewController
    }
}

struct SignInValidationView: View {
    
    @State private var viewControllerItem: UIKitViewControllerItem?
    
    var body: some View {
      VStack {
          Button {
              let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
              viewControllerItem = UIKitViewControllerItem(_viewController: vc)
          } label: {
              Text("Present ViewController")
          }
      }
      .fullScreenCover(item: $viewControllerItem) { vcItem in
            UIKitVisualisationHelper(viewController: vcItem.viewController)
                .ignoresSafeArea()
        }
    }
}

struct UIKitVisualisationHelper: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
  
    var viewController : UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
