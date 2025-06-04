//
//  MovieFavoriteCollectionViewCell.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 03/06/25.
//

import UIKit
import Kingfisher

protocol MovieFavoriteCollectionViewCellDelegate: AnyObject {
    func didSelectedFavoriteButton(sender: UIButton)
}

class MovieFavoriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: MovieFavoriteCollectionViewCell.self)
    
    weak var delegate: MovieFavoriteCollectionViewCellDelegate?
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapFavoriteButton(sender: UIButton) {
        self.delegate?.didSelectedFavoriteButton(sender: sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.contentView.addSubview(moviePosterImageView)
        self.contentView.addSubview(movieTitleLabel)
        self.contentView.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            moviePosterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 115),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 160),
            
            movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12),
            movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 7),
            favoriteButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    func configureCell(movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url, placeholder: UIImage(named: "photo"))
        movieTitleLabel.text = movie.title
    }
}
