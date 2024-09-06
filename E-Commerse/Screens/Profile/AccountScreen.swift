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
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: systemImage)
            Text(label)
                .font(.title2)
            Spacer()
            
            Image(systemName: "square.and.pencil")

        }
        .padding(3)
    }
}
