//
//  ContentView.swift
//  OdeumKopsas
//
//  Created by Angelos Staboulis on 18/9/21.
//

import SwiftUI
import SDWebImageSwiftUI
struct ContentView: View {
    @State var socialArray=["Facebook Group"]
    @ObservedObject var viewModel = OdeumViewModel()
    var body: some View {
        TabView{
            ZStack{
                NavigationView{
                        AnimatedImage(url: URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "gif")!)).resizable().frame(width: 300.0, height: 295.0, alignment: .center)
                            .navigationTitle(Text("Ωδείο Δ.Κόψα")).navigationBarTitleDisplayMode(.inline)
                }
            }.tabItem { Label(
                title: { Text("Αρχική") },
                icon: { Image("home") }
            ) }
            ZStack{
                NavigationView{
                    List(viewModel.newsRssArray,id:\.self){ item in
                        HStack{
                            WebImage(url: URL(string: item.image)).resizable().frame(width: 100.0, height: 100.0, alignment: .center)
                            NavigationLink(item.title, destination: SwiftUIWebView(urlString:item.link))
                        }
                        
                    }.navigationTitle(Text("Ωδείο Δ.Κόψα")).navigationBarTitleDisplayMode(.inline)
                }
                .onAppear {
                    viewModel.fetchNews()
                }
                
            }.tabItem { Label(
                title: { Text("Τα Νέα μας") },
                icon: { Image("news") }
            ) }
            ZStack{
                NavigationView{
                    List(socialArray,id:\.self){item in
                        NavigationLink(item, destination: SwiftUIWebView(urlString:"https://www.facebook.com/groups/247600945269605"))
                    }.navigationTitle(Text("Ωδείο Δ.Κόψα")).navigationBarTitleDisplayMode(.inline)
                }
            }.tabItem { Label(
                title: { Text("Social Media") },
                icon: { Image("schedule") }
            ) }
            ZStack{
                NavigationView{
                    List(viewModel.videoRssArray,id:\.self){ item in
                        HStack{
                            WebImage(url: URL(string: item.image)).resizable().frame(width: 100.0, height: 100.0, alignment: .center)
                            NavigationLink(item.title, destination: SwiftUIWebView(urlString:item.link))
                            
                        }.navigationTitle(Text("Ωδείο Δ.Κόψα")).navigationBarTitleDisplayMode(.inline)
                    }
                }.onAppear {
                    viewModel.fetchVideos()
                }
            }.tabItem { Label(
                title: { Text("Βίντεο") },
                icon: { Image("video") }
            ) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

