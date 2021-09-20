//
//  SwiftUIWebView.swift
//  OdeumKopsas
//
//  Created by Angelos Staboulis on 20/9/21.
//

import Foundation
import UIKit
import WebKit
import SwiftUI
final class SwiftUIWebView:UIViewRepresentable{
    
    var webView:WKWebView!
    
    var urlString:String!
    
    var webViewRequest:URLRequest!
    
    var urlWebView:URL!
    init(urlString:String){
        if urlString.count > 0 {
            webView = WKWebView(frame: .zero)
            urlWebView = URL(string: urlString)
            webViewRequest = URLRequest(url: urlWebView!)
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        webView.load(webViewRequest)
    }
    
    
    func makeUIView(context: Context) -> some UIView {
        return webView
       
    }
    
}
