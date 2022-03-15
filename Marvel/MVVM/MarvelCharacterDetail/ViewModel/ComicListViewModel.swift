//
//  ComicListViewModel.swift
//  Marvel
//
//  Created by Apple on 14/03/22.
//

import Foundation

protocol ComicsListViewModelDelegate {
    func didRecieveComicsList(response: ComicListResponse)
}

class ComicsListViewModel {
    
    let delegate : ComicsListViewModelDelegate
    
    private var comicListRepository : ComicListRepository?
    
    var reloadDetailTableView: (() -> Void)?
    
    var comicList : ComicListResponse?
    
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
         comicList = comiclists // Cache
         comicList?.data?.results?.forEach({ comic in
             comicListCellViewModels.append(createComicCellModel(comic: comic))
         })
    }
    
    func createComicCellModel(comic: ComicInfo) -> ComicListsCellViewModel {
        let comicId = comic.id
        let comicTitle = comic.title
        let comicDescription = comic.resultDescription
        let comicImagePath = comic.thumbnail?.fullPath
        
        return ComicListsCellViewModel(comicId: comicId, comicName: comicTitle, comicDescription: comicDescription, characterImageUrl: comicImagePath)
    }
    
    func getCurrentComicCellViewModel(at indexPath: IndexPath) -> ComicListsCellViewModel {
            return comicListCellViewModels[indexPath.row]
    }
    
    func fetchComicsList(characterId:Int){
            let resource = ComicsListResource()
        resource.fetchComicsList(isHud: true, currentOffSet: 0, characterId: String(characterId)) { (apiResponse) in
            if apiResponse?.code == 200 {
                self.delegate.didRecieveComicsList(response: apiResponse!)
                self.fetchComics(comiclists: apiResponse!)
            }
        }
    }
}
