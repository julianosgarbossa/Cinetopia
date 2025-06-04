//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 30/05/25.
//

import UIKit
import Kingfisher

protocol MovieTableViewCellDelegate: AnyObject {
    func didSelectedFavoriteButton(sender: UIButton)
}

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: MovieTableViewCell.self)
    
    weak var delegate: MovieTableViewCellDelegate?

    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white.withAlphaComponent(0.75)
        label.text = "Favoritar"
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    @objc
    private func didTapFavoriteButton(sender: UIButton) {
        self.delegate?.didSelectedFavoriteButton(sender: sender)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .background
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieReleaseDateLabel)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(favoriteLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            moviePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 90),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            movieTitleLabel.bottomAnchor.constraint(equalTo: movieReleaseDateLabel.topAnchor, constant: -8),
            
            movieReleaseDateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            movieReleaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            favoriteButton.topAnchor.constraint(equalTo: movieReleaseDateLabel.bottomAnchor, constant: 8),
            favoriteButton.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            
            favoriteLabel.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor),
            favoriteLabel.leadingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: 5),
            favoriteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func configureCell(movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url, placeholder: UIImage(named: "photo"))
        movieTitleLabel.text = movie.title
        movieReleaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
        
        let heart = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        let heartFill = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        
        if movie.isSelected ?? false {
            favoriteButton.setImage(heartFill, for: .normal)
        } else {
            favoriteButton.setImage(heart, for: .normal)
        }
    }
}
