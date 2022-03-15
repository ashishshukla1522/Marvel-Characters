//
//  Extension+CharactersListVc.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import Foundation
import UIKit

//MARK: InitialSetUp
extension CharactersListVc {
    func initialSetUp() {
        pagingManager.updateCurrentPagingInfo(currentOffSet: 0, totalDataCount: 0)
        
        charactersListViewModel.fetchCharactersList(offSet: 0)
    
        charactersListViewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.charactersListTableView.reloadData()
            }
        }
    }
}

//MARK: UITableView Delegate and DataSource methods
extension CharactersListVc : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersListViewModel.marvelCharacterCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersListTVCell.identifier, for: indexPath) as? CharactersListTVCell else {
            return UITableViewCell()
        }
        let cellModel = charactersListViewModel.getCurrentCellViewModel(at: indexPath)
        cell.cellViewModel = cellModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let character = charactersListViewModel.marvelCharacterCellViewModels[indexPath.row]

        if let thumbNailImage = imageManager.imageForKey(key: String(character.characterId ?? 0)) {
            (cell as? CharactersListTVCell)?.thumbnailImageView.image = thumbNailImage
            return
        }
        
        if let imagePath = character.characterImageUrl, let thumbnailUrl = URL(string: imagePath) {
            imageManager.downloadImageFromUrl(url: thumbnailUrl) { image in
                self.imageManager.saveImageInCache(image: image, forkey: String(character.characterId ?? 0))
                DispatchQueue.main.async {
                    (cell as? CharactersListTVCell)?.thumbnailImageView.image = image
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = charactersListViewModel.marvelCharacterCellViewModels[indexPath.row]
        let vc = ViewControllerAccessors.characterDetailVc
        vc.selectedCharacterInfo = selectedCharacter
        self.present(vc, animated: true, completion: nil)
    }
}

//MARK: ViewModel Delegate
extension CharactersListVc : CharactersListViewModelDelegate {
    func didRecieveCharactersList(response: CharactersListResponse) {
        
        charactersListViewModel.currentOffset = response.data?.offset
        charactersListViewModel.limit = response.data?.total
        
        charactersListViewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.charactersListTableView.reloadData()
                
            }
        }
        pagingManager.updateCurrentPagingInfo(currentOffSet: charactersListViewModel.currentOffset ?? 0, totalDataCount: charactersListViewModel.limit ?? 0)
        print(response)
    }
}

//MARK: UIScrollView Delegate Methods
extension CharactersListVc : UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        
        if ((charactersListTableView.contentOffset.y + charactersListTableView.frame.size.height) >= charactersListTableView.contentSize.height)
        {
            if pagingManager.checkIfThereAreMoreContentToLoad(charactersListViewModel.marvelCharacterCellViewModels.count) {
                
                charactersListViewModel.fetchCharactersList(offSet: pagingManager.getNewOffSet())
            }
            
        }
    }
}
