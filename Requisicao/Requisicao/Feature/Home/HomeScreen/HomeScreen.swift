//
//  HomeScreen.swift
//  Mock
//
//  Created by Alysson on 09/09/23.
//

import UIKit

class HomeScreen: UIView {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // retirando linhas
        tableView.showsVerticalScrollIndicator = false // desativando scrool indicator
        // tableView.transform = CGAffineTransform(scaleX: 1, y: -1) // tableView Contraria/ append item de baixo pra cima
        // TO DO: Register
        tableView.register(HomeCustomTableViewCell.self, forCellReuseIdentifier: HomeCustomTableViewCell.identifier)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    public func configConstraints(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addViews(){
        addSubview(tableView)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
    
        tableView.pinSafeArea(to: self)
        NSLayoutConstraint.activate( [
        ])
    }
}
