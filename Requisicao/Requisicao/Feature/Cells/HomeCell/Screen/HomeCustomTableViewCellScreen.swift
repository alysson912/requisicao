//
//  HomeCustomTableViewCellScreen.swift
//  Requisicao
//
//  Created by Alysson on 14/09/23.
//

import UIKit

class HomeCustomTableViewCellScreen: UIView {
    
    lazy var userimageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "iphone")
        image.contentMode = .scaleAspectFit
       
        return image
    }()
    
    lazy var genericLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste de Label"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    private func addViews(){
        addSubview(userimageView)
        addSubview(genericLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate( [
            
            userimageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userimageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            userimageView.heightAnchor.constraint(equalToConstant: 125),
            userimageView.widthAnchor.constraint(equalToConstant: 125),
            
            
            genericLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            genericLabel.leadingAnchor.constraint(equalTo: userimageView.trailingAnchor, constant: 12),
            genericLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
            
        ])
    }
}
