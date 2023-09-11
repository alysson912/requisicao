//
//  ViewController.swift
//  Mock
//
//  Created by Alysson on 09/09/23.
//

import UIKit

class HomeVC: UIViewController {
    
    let viewModel: HomeViewModel = HomeViewModel()
    
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        viewModel.fetchData()
    }


}

