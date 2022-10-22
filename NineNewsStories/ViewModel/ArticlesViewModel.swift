//
//  ArticlesViewModel.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 10/10/22.
//

import Foundation

class ArticlesViewModel: NSObject {
    private var articleService: ArticlesServiceProtocol

    var reloadTableView: (() -> Void)?
    
    var articles = Articles()
    
    var articleCellViewModels = [ArticleCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(articleService: ArticlesServiceProtocol = ArticlesService()) {
        self.articleService = articleService

    }
    
    func getArticles() {
        articleService.getArticles { success, model, error in
            if success, let article = model {
                self.fetchData(article: article)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(article: Article) {
        if let assets = article.assets {
            self.articles = assets // Cache
            var vms = [ArticleCellViewModel]()
            for article in articles {
                vms.append(createCellModel(asset: article))
            }
            vms = vms.sorted(by: { // sort by last modified date
                $0.lastModifiedDate.compare($1.lastModifiedDate) == .orderedDescending
            })
            articleCellViewModels = vms
        }
    }
    
    func createCellModel(asset: Asset) -> ArticleCellViewModel {
        let headline = asset.headline
        let abstract = asset.theAbstract
        let byLine = asset.byLine
        let thumbnail = asset.relatedImages[0].url
        let lastModified = asset.lastModified
        let articleURL = asset.url
        
        return ArticleCellViewModel(headline: headline, abstract: abstract, byLine: byLine, thumbnail: thumbnail, lastModified: lastModified, articleURL: articleURL)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> ArticleCellViewModel {
            return articleCellViewModels[indexPath.row]
        }
}

