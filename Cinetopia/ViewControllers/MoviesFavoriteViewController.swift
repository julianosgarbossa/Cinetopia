//
//  MoviesFavoriteViewController.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 02/06/25.
//

import UIKit

class MoviesFavoriteViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 10, right: 40)
        layout.minimumLineSpacing = 40
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieFavoriteCollectionViewCell.self, forCellWithReuseIdentifier: MovieFavoriteCollectionViewCell.identifier)
        collectionView.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FavoriteCollectionReusableView.identifier)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        self.addSubviews()
        self.setupConstraints()
        self.setupNavigationBar()
    }
    
    private func addSubviews() {
        self.view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension MoviesFavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieManager.shared.favoritesMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieFavoriteCollectionViewCell.identifier, for: indexPath) as? MovieFavoriteCollectionViewCell else { return UICollectionViewCell() }
        let currentMovie = MovieManager.shared.favoritesMovies[indexPath.row]
        cell.configureCell(movie: currentMovie)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FavoriteCollectionReusableView.identifier, for: indexPath) as? FavoriteCollectionReusableView else { return UICollectionReusableView() }
            header.configHeader(text: "Meus filmes favoritos")
            return header
        }
        return UICollectionReusableView()
    }
}

extension MoviesFavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

extension MoviesFavoriteViewController: UICollectionViewDelegate {
    
}

extension MoviesFavoriteViewController: MovieFavoriteCollectionViewCellDelegate {
    func didSelectedFavoriteButton(sender: UIButton) {
        guard let cell = sender.superview?.superview as? MovieFavoriteCollectionViewCell else { return }
        
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        let selectedMovie = MovieManager.shared.favoritesMovies[indexPath.item]
        
        selectedMovie.changeSelectionStatus()
        
        MovieManager.shared.remove(movie: selectedMovie)
        
        collectionView.reloadData()
    }
}
