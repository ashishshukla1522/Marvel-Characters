//
//  Extension+CharacterDetailVc.swift
//  Marvel
//
//  Created by Apple on 14/03/22.
//

import Foundation
import UIKit
import CryptoKit

//MARK: Initial SetUp
extension CharacterDetailVC {
    func initialSetup() {
        
        
        //Calling API to fetch Comics Lists
        comicslistViewModel.fetchComicsList(characterId: selectedCharacterInfo?.characterId ?? 0)
        setImageForCharacter()
        
    }
    
    fileprivate func setImageForCharacter() {
        guard let characterURL = selectedCharacterInfo?.characterImageUrl else {
            return
        }
        
        if let thumbnailUrl = URL(string: characterURL) {
            imageManager.getImageFrom(url: thumbnailUrl) { image, urlString in
                self.imageManager.saveImageInCache(image: image, forkey: characterURL)
                DispatchQueue.main.async {
                    if characterURL == urlString {
                        self.characterImageView.image = image
                    }
                }
            }
        }
        
    }
    
}


//MARK: UITableView Data source and delegate Methods
extension CharacterDetailVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let characterInfoCell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTvCell.identifier, for: indexPath) as? CharacterInfoTvCell else {
                return UITableViewCell()
            }
            characterInfoCell.characterNameLabel.text = selectedCharacterInfo?.characterName
            characterInfoCell.characterDetailLabel.text = selectedCharacterInfo?.characterDescription ?? "Description is unavailable that is why showing dummy text"
            return characterInfoCell
            
        default:
            guard let comicListCell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetailInfoTVCell", for: indexPath) as? CharacterDetailInfoTVCell else {
                return UITableViewCell()
            }
            comicListCell.characterDetailCollectionView.reloadData()
            comicListCell.characterDetailTitleLabel.text = "Comics"
            return comicListCell
        }
    }    
}

//MARK: UICollectionView Delegate and DataSource Methods
extension CharacterDetailVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comicslistViewModel.comicListCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let comicsCell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterDetailInfoCVCell.identifier, for: indexPath) as? CharacterDetailInfoCVCell else {
            return UICollectionViewCell()
        }
        let model = comicslistViewModel.comicListCellViewModels[indexPath.row]
        comicsCell.comicCellViewModel = model
        return comicsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let characterURL = comicslistViewModel.comicListCellViewModels[indexPath.row].comicImageUrl else {
            return
        }
        
        if let thumbnailUrl = URL(string: characterURL) {
            imageManager.getImageFrom(url: thumbnailUrl) { image, urlString in
                self.imageManager.saveImageInCache(image: image, forkey: characterURL)
                DispatchQueue.main.async {
                    if characterURL == urlString {
                        (cell as? CharacterDetailInfoCVCell)?.characterDetailImagview.image = image
                    }
                }
            }
        }
    }
}

//MARK: ComicListViewModel Delegate Methods
extension CharacterDetailVC : ComicsListViewModelDelegate {
    
    
    func didRecieveComicsList(response: ComicListResponse?, error: ErrorType?) {
        if error == nil {
            comicLists = response
            comicslistViewModel.reloadDetailTableView = { [weak self] in
                DispatchQueue.main.async {
                    self?.characterDetailTableView.reloadData()
                }
            }
        }else {
            ErrorHandler.handleErrorWith(error: error ?? .ErrorInFetchingDataFromServer, viewController: self)
        }
        
        
    }
}

