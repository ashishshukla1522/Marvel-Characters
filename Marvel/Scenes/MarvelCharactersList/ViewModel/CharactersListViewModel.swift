//
//  CharactersListViewModel.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import Foundation

protocol CharactersListViewModelDelegate {
    func didRecieveCharactersList(response: CharactersListResponse?,error:ErrorType?)
}

class CharactersListViewModel {
    
    let delegate : CharactersListViewModelDelegate
    private var characterListRepository : CharactersListRepository?
    
    var reloadTableView: (() -> Void)?
    
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
        let characters = marvelcharacters.data?.results?.map({ createCellModel(marverlcharacter: $0) }) ?? []
        marvelCharacterCellViewModels.append(contentsOf: characters)
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
        resource.fetchCharactersList(isHud: true, currentOffSet: offSet) { (apiResponse,error)  in
            if apiResponse?.code == 200 && error == nil{
                self.delegate.didRecieveCharactersList(response: apiResponse!, error: nil)
                self.fetchCharacters(marvelcharacters: apiResponse!)
            }else {
                self.delegate.didRecieveCharactersList(response: nil, error: error)
            }
        }
    }
    
    func getCurrentCellViewModel(at indexPath: IndexPath) -> CharactersListCellViewModel {
        return marvelCharacterCellViewModels[indexPath.row]
    }
}


