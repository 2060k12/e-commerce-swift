//
//  AccountScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import SwiftUI

struct AccountScreen: View {
    
    @StateObject var viewModel = AccountViewModel.initialize

    var body: some View {
  
      
            ZStack{
                VStack{
                    VStack {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:150, height: 150)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        Text("Pranish Pathak")
                            .font(.title2)
                            .bold()
                    }.padding()
                    
                    List{
                        Section {
                            
                            ProfileList(label: "Full Name", systemImage: "person")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.editType = .fullName
                                    viewModel.showEditScreen = true
                                    
                                }
                            ProfileList(label: "Email", systemImage: "mail")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.editType = .email
                                    viewModel.showEditScreen = true
                                }
                            ProfileList(label: "Address", systemImage: "location")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.editType = .address
                                    viewModel.showEditScreen = true
                                }
                            ProfileList(label: "Password", systemImage: "lock")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.editType = .password
                                    viewModel.showEditScreen = true
                                }
                            
                    
                        }
                        
                        
                        
                        Section{
                            ProfileList(label: "Privacy Policy", systemImage: "lock.square.fill", showEdit: false)
                            ProfileList(label: "Help Center", systemImage: "questionmark.circle", showEdit: false)
                            ProfileList(label: "Sigout", systemImage: "arrow.up.forward.app", showEdit: false)
                            
                          
                        }
                        
                    }
                
                    
                    
                    
                    
                    Spacer()
                    
                }
                
            }
            
            .navigationTitle("Account")
            .sheet(isPresented: $viewModel.showEditScreen, content: {
                EditScreen()
            })
            
        }
    }


#Preview {
    AccountScreen()
}

struct ProfileList: View {
    let label : String
    let systemImage : String
    var showEdit = true
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: systemImage)
            Text(label)
                .font(.title2)
            Spacer()
            
            if(showEdit) { Image(systemName: "square.and.pencil")}
            

        }
        .padding(3)
    }
}
