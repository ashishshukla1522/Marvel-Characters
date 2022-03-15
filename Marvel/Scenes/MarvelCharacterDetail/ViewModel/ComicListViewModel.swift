//
//  ComicListViewModel.swift
//  Marvel
//
//  Created by Apple on 14/03/22.
//

import Foundation

protocol ComicsListViewModelDelegate {
    func didRecieveComicsList(response: ComicListResponse?, error:ErrorType?)
}

class ComicsListViewModel {
    
    let delegate : ComicsListViewModelDelegate
    
    private var comicListRepository : ComicListRepository?
    
    var reloadDetailTableView: (() -> Void)?
    
    var comicListCellViewModels = [ComicListsCellViewModel]() {
        didSet {
            reloadDetailTableView?()
        }
    }
    
    init(comicListRepository: ComicListRepository = ComicsListResource() , _delegate:ComicsListViewModelDelegate) {
        self.delegate = _delegate
        self.comicListRepository = comicListRepository
    }
    
    func fetchComics(comiclists: ComicListResponse) {
        let comics = comiclists.data?.results?.map({ createComicCellModel(comic: $0) }) ?? []
        comicListCellViewModels.append(contentsOf: comics)
    }
    
    func createComicCellModel(comic: ComicInfo) -> ComicListsCellViewModel {
        let comicId = comic.id
        let comicTitle = comic.title
        let comicDescription = comic.resultDescription
        let comicImagePath = comic.thumbnail?.fullPath
        
        return ComicListsCellViewModel(comicId: comicId, comicName: comicTitle, comicDescription: comicDescription, comicImageUrl: comicImagePath)
    }
    
    func getCurrentComicCellViewModel(at indexPath: IndexPath) -> ComicListsCellViewModel {
        return comicListCellViewModels[indexPath.row]
    }
    
    func fetchComicsList(characterId:Int){
        let resource = ComicsListResource()
        resource.fetchComicsList(isHud: true, currentOffSet: 0, characterId: String(characterId)) { (apiResponse,error) in
            if apiResponse?.code == 200 && error == nil {
                self.delegate.didRecieveComicsList(response: apiResponse!, error: nil)
                self.fetchComics(comiclists: apiResponse!)
            }else {
                self.delegate.didRecieveComicsList(response: nil, error: error)

            }
        }
    }
}
