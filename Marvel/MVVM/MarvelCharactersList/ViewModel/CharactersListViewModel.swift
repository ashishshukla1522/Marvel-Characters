//
//  CharactersListViewModel.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import Foundation

protocol CharactersListViewModelDelegate {
    func didRecieveCharactersList(response: CharactersListResponse)
}

class CharactersListViewModel {
    
    let delegate : CharactersListViewModelDelegate
    private var characterListRepository : CharactersListRepository?
    
    var reloadTableView: (() -> Void)?
    
    var marvelCharacters : CharactersListResponse?
    
    var currentOffset : Int?
    var totalData : Int?
    var limit : Int?
    
    var marvelCharacterCellViewModels = [CharactersListCellViewModel]() {
        didSet {
            reloadTableView?()
            
        }
    }
    
    init(characterListRepository: CharactersListRepository = CharactersListResource(),_delegate:CharactersListViewModelDelegate) {
        self.delegate = _delegate
        self.characterListRepository = characterListRepository
    }
    
     func fetchCharacters(marvelcharacters: CharactersListResponse) {
        marvelCharacters = marvelcharacters 
        marvelCharacters?.data?.results?.forEach { marverlCharacter in
            marvelCharacterCellViewModels.append(createCellModel(marverlcharacter: marverlCharacter))
        }
        
    }
    
    func createCellModel(marverlcharacter: CharactersInfo) -> CharactersListCellViewModel {
        let id = marverlcharacter.id
        let name = marverlcharacter.name
        let description = marverlcharacter.resultDescription
        let imagePath = marverlcharacter.thumbnail?.fullPath
        
        return CharactersListCellViewModel(characterId: id, characterName: name, characterDescription: description, characterImageUrl: imagePath)
    }
    
    func fetchCharactersList(offSet:Int){
        let resource = CharactersListResource()
        resource.fetchCharactersList(isHud: true, currentOffSet: offSet) { (apiResponse) in
            if apiResponse?.code == 200 {
                self.delegate.didRecieveCharactersList(response: apiResponse!)
                self.fetchCharacters(marvelcharacters: apiResponse!)
            }
        }
    }
    
    func getCurrentCellViewModel(at indexPath: IndexPath) -> CharactersListCellViewModel {
            return marvelCharacterCellViewModels[indexPath.row]
        }
}


