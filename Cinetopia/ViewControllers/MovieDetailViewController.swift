//
//  MovieDetailViewController.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 30/05/25.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var movie: Movie
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = movie.title
        label.textColor = .label
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "photo"))
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var movieSynopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        self.addSubviews()
        self.setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(movieTitleLabel)
        view.addSubview(moviePosterImageView)
        view.addSubview(movieRatingLabel)
        view.addSubview(movieSynopsisLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            moviePosterImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 32),
            moviePosterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 180),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 255),
            
            movieRatingLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 32),
            movieRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movieSynopsisLabel.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant: 32),
            movieSynopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieSynopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
