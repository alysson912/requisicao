//
//  ViewController.swift
//  Mock
//
//  Created by Alysson on 09/09/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    
    private func setupTableViewTest(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate(delegate: self)
        viewModel.fetchData() // viewModel vai verificar se houve alguma alteração nos dados do json
    }


}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCustomTableViewCell.identifier, for: indexPath) as? HomeCustomTableViewCell
        
        cell?.setupCell(data: viewModel.loadCurrenDatat(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension HomeVC: HomeViewModelProtocol {
    func succes() {
        DispatchQueue.main.async {
            self.screen?.configTableView(delegate: self, dataSource: self) // assinando protocolo da tableView
            self.screen?.tableView.reloadData()
        }
       
    }
    
    func error(detail: String) {
        print(detail)
    }
    
    
}
