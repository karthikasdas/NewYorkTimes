//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Karthika on 7/29/21.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    private func createSUT() -> NewsListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
    }

    func test_TableView() {
        let newsListViewCountroller = createSUT()
        XCTAssertNotNil(newsListViewCountroller.tableView)
    }
        
    func test_setsDataSource() {
        let newsListViewCountroller = createSUT()
        let test_newsDataSource = NewsListDataSource.init(results: [Results(url: "url1", publishedDate: "23-01-2021", updated: "", section: "", subsection: "", byline: "me1", title: "title1", abstract: ""),Results(url: "url2", publishedDate: "30-01-2021", updated: "", section: "", subsection: "", byline: "me2", title: "title2", abstract: "")])
        newsListViewCountroller.newsDataSource = test_newsDataSource
        XCTAssertTrue(newsListViewCountroller.tableView.dataSource === test_newsDataSource)
    }
    
    func test_rowShowsCorrectNews() {
        let news = [Results(url: "url1", publishedDate: "23-01-2021", updated: "", section: "", subsection: "", byline: "me1", title: "title1", abstract: ""),Results(url: "url2", publishedDate: "30-01-2021", updated: "", section: "", subsection: "", byline: "me2", title: "title2", abstract: "")]
        let sut = NewsListDataSource(results: news)
        let vc = createSUT()
        let tablewView = vc.tableView!
        tablewView.dataSource = sut
        tablewView.reloadData()
        let cell = tablewView.cellForRow(at: IndexPath(row: 0, section: 0)) as? NewsCellTableView
        XCTAssertEqual("me1", cell?.cellData.byline)
        XCTAssertEqual("NEWS_TABLE_CELL_IDENTIFIER", cell?.reuseIdentifier)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
