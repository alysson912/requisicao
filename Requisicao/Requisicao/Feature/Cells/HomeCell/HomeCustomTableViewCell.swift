//
//  HomeCustomTableViewCell.swift
//  Requisicao
//
//  Created by Alysson on 14/09/23.
//

import UIKit

class HomeCustomTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: HomeCustomTableViewCell.self)
    
    lazy var screen: HomeCustomTableViewCellScreen = {
        let view = HomeCustomTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
