//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 29/05/25.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private let movieService: MovieService = MovieService()
    private var moviesAPI: [Movie] = []
    private var filteredMovies: [Movie] = []
    private var isSearchActive: Bool = false
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        self.addSubviews()
        self.setupConstraints()
        self.setupNavigationBar()
        Task {
            await self.fetchMovies()
        }
        
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupNavigationBar() {
        // Esconde o botão de voltar
        navigationItem.setHidesBackButton(true, animated: false)

        // Define a searchBar como título
        navigationItem.titleView = searchBar
        title = "Filmes populares"

        // Aparência quando a navigation bar está travada no topo no momento do scroll
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = .tabBarBackground
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        // Aparência quando a navigation está no seu estado normal
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.backgroundColor = .background
        scrollEdgeAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        // Aplica os estilos na navigation bar
        let navigationBar = navigationController?.navigationBar
        navigationBar?.standardAppearance = standardAppearance
        navigationBar?.scrollEdgeAppearance = scrollEdgeAppearance
        navigationBar?.compactAppearance = standardAppearance
        navigationBar?.prefersLargeTitles = true
    }
    
    private func fetchMovies() async {
        do {
            moviesAPI = try await movieService.getMovies().shuffled()
            self.tableView.reloadData()
        } catch (let error) {
            print(error)
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredMovies.count : moviesAPI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movie = isSearchActive ? filteredMovies[indexPath.row] : moviesAPI[indexPath.row]
        cell.configureCell(movie: movie)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Se o teclado está visível, apenas o esconde
        if searchBar.isFirstResponder {
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
            return
        }
        
        // Se o teclado não está visível, navega normalmente
        let movie = isSearchActive ? filteredMovies[indexPath.row] : moviesAPI[indexPath.row]
        let movieDetailViewController = MovieDetailViewController(movie: movie)
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
        } else {
            isSearchActive = true
            filteredMovies = moviesAPI.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        isSearchActive = false
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}

extension MoviesViewController: MovieTableViewCellDelegate {
    func didSelectedFavoriteButton(sender: UIButton) {
        guard let cell = sender.superview?.superview as? MovieTableViewCell else { return }
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let selectedMovie = isSearchActive ? filteredMovies[indexPath.row] : moviesAPI[indexPath.row]
        
        selectedMovie.changeSelectionStatus()
        
        MovieManager.shared.add(movie: selectedMovie)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
