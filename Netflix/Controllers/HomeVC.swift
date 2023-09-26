//
//  HomeVC.swift
//  Netflix
//
//  Created by Apple on 23/09/23.
//

import UIKit

class HomeVC: UIViewController {

    let sectionTitles : [String] = [
        "Trending Movies", "Trending TV Shows", "Popular", "Upcoming Movies", "Top Rated"
    ]
    
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self , forCellReuseIdentifier: "CollectionViewTableViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureNavBar()
        
        //Add Subviews.
        view.addSubview(homeFeedTable)
        
        homeFeedTable.dataSource = self
        homeFeedTable.delegate = self
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
        //Functionalities Calls.
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func configureNavBar(){
        var image = UIImage(named: "netflixLogo")
        
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .label
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        //header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    // A TableView is basically a scroll view and it inherits all the methods of scrollView. So below code is used to drag upward and Hide status bar when scroll up and when scroll down, again dragged down and snapped on its position at top.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}

// MARK: - Functionalities

extension HomeVC {
    
    private func fetchData(){
        APICaller.shared.getTrendingMovies { result in
            switch result {
            case .success(let movies) :
                print("-----------------------------------")
                print("-----------------Trending Movies------------------")
                print("-----------------------------------")
                print(movies)
            case .failure(let error) :
                print(error)
            }
        }
        
        APICaller.shared.getTrendingTvShows { result in
            switch result {
            case .success(let tv_shows) :
                print("-----------------------------------")
                print("-----------------Trending TV Shows------------------")
                print("-----------------------------------")
                print(tv_shows)
            case .failure(let error) :
                print(error)
            }
        }
        
        APICaller.shared.getUpcomingMovies { result in
            switch result {
            case .success(let movies) :
                print("-----------------------------------")
                print("-----------------Upcoming Movies------------------")
                print("-----------------------------------")
                print(movies)
            case .failure(let error) :
                print(error)
            }
        }
        
        APICaller.shared.getPopularMovies { result in
            switch result {
            case .success(let movies) :
                print("-----------------------------------")
                print("-----------------Popular Movies------------------")
                print("-----------------------------------")
                print(movies)
            case .failure(let error) :
                print(error)
            }
        }
        
        APICaller.shared.getTopRatedMovies { result in
            switch result {
            case .success(let movies) :
                print("-----------------------------------")
                print("-----------------Top Rated Movies------------------")
                print("-----------------------------------")
                print(movies)
            case .failure(let error) :
                print(error)
            }
        }
    }
    
}
