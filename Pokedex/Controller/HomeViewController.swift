//
//  ViewController.swift
//  PokedexProject
//
//  Created by Felipe Domingos on 08/12/22.
//

import UIKit
import ColorKit
import AlamofireImage

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let rest = RestManager()
    var pokeFilter: [String] = []
    
    override func loadView() {
        self.view = self.homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.homeView.configProtocolsCollectionView(delegate: self, dataSource: self)
        self.homeView.configProtocolsSearchBar(delegate: self)
        self.addData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func addData() {
        self.rest.validatepokemon() { result in
            for i in result.results {
                let list = i.name
                self.pokeFilter.append(list)
                self.homeView.collectionView.reloadData()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokeFilter.count > 25 ? 25 : pokeFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokeCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PokeCollectionViewCell.indentifier, for: indexPath) as? PokeCollectionViewCell
            cell?.nameLabel.text = self.pokeFilter[indexPath.row]
        self.rest.validatepokemonDetails(name: self.pokeFilter[indexPath.row]) { details in
            cell?.addImageAndVIew(data: details)
        }
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath) {
        self.view.endEditing(true)
        let detailsViewController = DetailsViewController(data: pokeFilter[indexPath.row] )
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}

extension HomeViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.pokeFilter.removeAll()

        if searchText.isEmpty {
            self.addData()
        } else {
            self.rest.validatepokemon { result in
                for value in result.results {
                    if value.name.uppercased().contains(searchText.uppercased()) {
                        self.pokeFilter.append(value.name)
                    }
                }
                self.homeView.collectionView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.becomeFirstResponder()
    }
}
