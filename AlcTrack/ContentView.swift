//
//  ContentView.swift
//  AlcTrack
//
//  Created by Joseph Lu on 5/24/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    @State var selectedIndex = 0
    @State var shouldShowModal = false
    @State var currentBAC = 0.00
    
    let tabBarImageNames = ["house", "clock", "plus.app.fill", "note.text", "person"]
    
    var getBAC: String {
        var currBAC = currentBAC
        return "test"
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                
                Spacer().fullScreenCover(isPresented: $shouldShowModal, content: {
                    Button(action: {shouldShowModal.toggle()}, label: {
                        Text("Full screen cover")
                    })
                    
                })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            Text("BAC: \(String(currentBAC))")
                            Button("Add 1 Shot") {
                                currentBAC += 0.03
                            }
                        }
                        .navigationTitle("First Tab")
                    }
                    
                case 1:
                    NavigationView {
                        Text("Second")
                            .navigationTitle("Second Tab")
                    }
                    
                case 3:
                    NavigationView {
                        Text("Second")
                            .navigationTitle("Third Tab")
                    }
                    
                case 4:
                    NavigationView {
                        Text("Second")
                            .navigationTitle("Fourth Tab")
                    }
                    
                default:
                    Text("Second")
                }
            }
                
            //Spacer()
            
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        
                        if num == 2 {
                            shouldShowModal.toggle()
                            return
                        }
                        
                         selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.indigo)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        
                        Spacer()
                    })
                }
            }
    
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
