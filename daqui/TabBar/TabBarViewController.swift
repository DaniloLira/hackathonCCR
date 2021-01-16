//
//  TabBarViewController.swift
//  daqui
//
//  Created by Samuel Brasileiro on 15/01/21.
//

import UIKit
import SwiftUI

protocol SelectedViewDelegate{
    func changeSelectedIndex()
}

class SelectedView: ObservableObject{
    @Published var index: Int = 0
    var items: [TabViewItem] = []
    
    init(){
        //TODO: Criar novos ViewControllers
        let businessTab: [TabViewItem] = [
            TabViewItem(ProfileViewController(), name: "Descoberta"),
            TabViewItem(ProfileViewController(), name: "Meu Perfil"),
            TabViewItem(ProfileViewController(), name: "Guia")
        ]
        
        //TODO: Criar novos ViewControllers
        let costumerTab: [TabViewItem] = [
            TabViewItem(ProfileViewController(), name: "Explorar"),
            TabViewItem(ProfileViewController(), name: "Meu Perfil"),
            TabViewItem(ProfileViewController(), name: "Trilhas"),
            TabViewItem(ProfileViewController(), name: "Cupons")
        ]
        
        //TODO: Modificar condicional
        self.items = false ? costumerTab : businessTab
        
    }
    
    func getViewControllers() -> [UIViewController] {
        items.map { $0.viewController }
    }
}

class TabBarViewController: UITabBarController, SelectedViewDelegate {
    let handler = FirebaseHandler()
    var selectedView = SelectedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = selectedView.getViewControllers()
        self.loadTabBar()
    }

    func changeSelectedIndex() {
        self.selectedIndex = selectedView.index
    }
    
    func loadTabBar() {
        let tabBarHost = UIHostingController(rootView: TabBarView(selectedView: selectedView, delegate: self))
        self.addChild(tabBarHost)
        self.view.addSubview(tabBarHost.view)
    }

}
