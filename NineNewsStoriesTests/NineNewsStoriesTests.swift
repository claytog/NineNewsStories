//
//  NineNewsStoriesTests.swift
//  NineNewsStoriesTests
//
//  Created by Clayton Gilbert on 10/10/22.
//

import XCTest
@testable import NineNewsStories

class NineNewsStoriesTests: XCTestCase {

    let jsonString = """
    {"id":67184313,"categories":[],"authors":[],"url":"/content/dam/lists/1/3/z/z/q/x/list.html","lastModified":1666340088260,"onTime":1425955024417,"sponsored":false,"displayName":"AFR iPad Editor's Choice","assets":[{"id":1520601747,"categories":[{"name":"Technology","sectionPath":"/technology","orderNum":0}],"authors":[{"name":"Chanticleer","title":"Columnist","email":"","relatedAssets":[],"relatedImages":[{"id":1030117386,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/1/a/z/n/u/image.imgtype.afrWoodcutAuthorImage.140x140.png/1549519435387.jpg","lastModified":1549519435387,"sponsored":false,"description":"","photographer":"","type":"afrWoodcutAuthorImage","width":140,"height":140,"assetType":"IMAGE","timeStamp":1549519435387},{"id":67385547,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/1/4/4/b/0/r/image.imgtype.afrWoodcutAuthorImage.140x140.png/1426357827234.png","lastModified":1426357827234,"sponsored":false,"description":" ","photographer":"","type":"afrWoodcutAuthorImage","width":140,"height":140,"assetType":"IMAGE","timeStamp":1426357827234}]}],"url":"http://www.afr.com/technology/china-us-tech-war-puts-rest-of-the-world-in-a-fix-20221021-p5brtf","lastModified":1666338541897,"sponsored":false,"headline":"China-US tech war puts rest of the world in a fix","indexHeadline":"China-US tech war puts rest of the world in a fix","tabletHeadline":"","theAbstract":"The world is headed for two technology clusters divided by allegiance to China or the US. This will throw up extremely difficult challenges for the global trading system.","byLine":"Tony Boyd","acceptComments":false,"numberOfComments":0,"relatedAssets":[{"id":1520601439,"categories":[{"name":"Asia","sectionPath":"/news/world/asia","orderNum":0}],"authors":[],"url":"http://www.afr.com/news/world/asia/us-mulling-joint-weapons-production-with-taiwan-says-business-lobby-20221020-p5brkv","lastModified":1666250068439,"sponsored":false,"assetType":"ARTICLE","headline":"US mulling joint weapons production with Taiwan, says business lobby","timeStamp":1666250028000}],"relatedImages":[{"id":1031625606,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/2/7/b/e/u/image.related.wideLandscape.1500x844.p5brtf.13zzqx.png/1666340088260.jpg","lastModified":1666338541974,"sponsored":false,"description":"The chips are down in the global bet on who will win the US v China tech war.","photographer":"David Rowe","type":"wideLandscape","width":1500,"height":844,"assetType":"IMAGE","xLarge@2x":"","xLarge":"","large@2x":"","large":"","thumbnail@2x":"","thumbnail":"","timeStamp":1666338541974},{"id":1031625606,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/2/7/b/e/u/image.related.thumbnail.375x250.p5brtf.13zzqx.png/1666340088260.jpg","lastModified":1666338541974,"sponsored":false,"description":"The chips are down in the global bet on who will win the US v China tech war.","photographer":"David Rowe","type":"thumbnail","width":375,"height":250,"assetType":"IMAGE","timeStamp":1666338541974},{"id":1031625606,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/2/7/b/e/u/image.related.afrArticleLead.1536x1010.p5brtf.13zzqx.png/1666340088260.jpg","lastModified":1666338541974,"sponsored":false,"description":"The chips are down in the global bet on who will win the US v China tech war.","photographer":"David Rowe","type":"afrArticleLead","width":1536,"height":1010,"assetType":"IMAGE","xLarge@2x":"","large@2x":"","timeStamp":1666338541974},{"id":1031625606,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/2/7/b/e/u/image.related.articleLeadwide.1500x844.p5brtf.13zzqx.png/1666340088260.jpg","lastModified":1666338541974,"sponsored":false,"description":"The chips are down in the global bet on who will win the US v China tech war.","photographer":"David Rowe","type":"articleLeadWide","width":1500,"height":844,"assetType":"IMAGE","xLarge@2x":"","xLarge":"","large@2x":"","large":"","thumbnail@2x":"","thumbnail":"","timeStamp":1666338541974},{"id":1031625606,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/2/7/b/e/u/image.related.afrIndexLead.1536x1010.p5brtf.13zzqx.png/1666340088260.jpg","lastModified":1666338541974,"sponsored":false,"description":"The chips are down in the global bet on who will win the US v China tech war.","photographer":"David Rowe","type":"afrIndexLead","width":1536,"height":1010,"assetType":"IMAGE","xLarge@2x":"","xLarge":"","large@2x":"","large":"","thumbnail@2x":"","thumbnail":"","timeStamp":1666338541974},{"id":1031625606,"categories":[],"brands":[],"authors":[],"url":"https://www.fairfaxstatic.com.au/content/dam/images/h/2/7/b/e/u/image.related.landscape.1174x783.p5brtf.13zzqx.png/1666340088260.jpg","lastModified":1666338541974,"sponsored":false,"description":"The chips are down in the global bet on who will win the US v China tech war.","photographer":"David Rowe","type":"landscape","width":1174,"height":783,"assetType":"IMAGE","large@2x":"","large":"","thumbnail@2x":"","thumbnail":"","timeStamp":1666338541974}],"signPost":"OPINION","companies":[],"legalStatus":"None","sources":[{"tagId":"AFR"}],"assetType":"ARTICLE","overrides":{"overrideHeadline":"China-US tech war puts rest of the world in a fix","overrideAbstract":"The world is headed for two technology clusters divided by allegiance to China or the US. This will throw up extremely difficult challenges for the global trading system."},"timeStamp":1666338478000}],"relatedAssets":[],"relatedImages":[],"assetType":"ASSET_LIST","timeStamp":1666340086556}
    """
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArticlesViewModel() throws {
        // This tests the articlesViewModel with the mock data (json string), and ensures that this data is decodable.
        let articlesViewModel = ArticlesViewModel(articleService: ArticlesService())
        
        let jsonData = jsonString.data(using: .utf8)!
        let article: Article = try! JSONDecoder().decode(Article.self, from: jsonData)
        
        if let assets = article.assets, assets.count > 0 {
            let articalCellViewModel:ArticleCellViewModel = articlesViewModel.createCellModel(asset: assets[0])
        
            XCTAssertEqual(articalCellViewModel.headline, "China-US tech war puts rest of the world in a fix")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
