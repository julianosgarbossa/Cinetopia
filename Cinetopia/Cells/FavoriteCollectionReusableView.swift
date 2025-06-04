//
//  FavoriteCollectionReusableView.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 03/06/25.
//

import UIKit

class FavoriteCollectionReusableView: UICollectionReusableView {
    
    static let identifier: String = String(describing: FavoriteCollectionReusableView.self)
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(headerLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configHeader(text: String) {
        headerLabel.text = text
    }
}
