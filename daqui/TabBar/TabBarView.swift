//
//  TabBarView.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var selectedView: SelectedView
    var delegate: SelectedViewDelegate?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.systemBackground))
                .shadow(color: Color(.systemGray2), radius: 10, x: 0, y: 0)
                
            
            HStack {
                ForEach(0..<self.selectedView.items.count) { index in
                    VStack {
                        Button(action: {
                            self.selectedView.index = index
                            delegate?.changeSelectedIndex()
                        }) {
                            Image("\(selectedView.items[index].name)\(selectedView.index == index ? "_Ativo" : "")")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 28, height: 28)
                                .padding(.horizontal)
                        }
                        
                        Text(selectedView.items[index].name)
                            .font(.caption)
                            .foregroundColor(selectedView.index == index ? .blue : .gray)
                    }
                    .padding(.vertical, 10)

                }.padding(.horizontal)
            }
        }
    }
}
