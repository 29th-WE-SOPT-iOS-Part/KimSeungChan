//
//  HomeViewController.swift
//  iOS-Assignment
//
//  Created by 김승찬 on 2021/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var story : [Story] = []
    var media : [Media] = []
    private let items: [String] = [
            "또띠아",
            "버터",
            "달걀",
            "치즈볼",
            "쪽파",
            "진미채",
            "참외",
            "케이크",
            "새우",
            "대패삼겹살",
        ]
    
    let ggamjuImageArray = Const.Image.ggamjuImageArray
    let ggamjuArray = Const.Image.ggamjuArray
    let array = ["1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", "4차 iOS 세미나 : Cocoapods & Networking, REST API", "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화"]
   

    @IBOutlet var storyCollectionView: UICollectionView!
    
    @IBOutlet var categoryCollectionView: UICollectionView!
    
    @IBOutlet var mediaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()
        registerXib()
        setupCollectionView()
        story.append(contentsOf: [
            Story(mainImage: Const.Image.ggamju1 , title: "iOSPart"),
            Story(mainImage: Const.Image.ggamju2, title: "AndroidPart"),
            Story(mainImage: Const.Image.ggamju3, title: "ServerPart"),
            Story(mainImage: Const.Image.ggamju4, title: "WebPart"),
            Story(mainImage: Const.Image.ggamju5, title: "DesignPart"),
            Story(mainImage: Const.Image.ggamju6, title: "PlanPart"),
        ])
     
        media.append(contentsOf: [
            Media(mainTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Media(mainTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Media(mainTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Media(mainTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Media(mainTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
        ])
     
    }
   
    private func registerXib() {
        let nibName = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
         storyCollectionView.register(nibName, forCellWithReuseIdentifier: "StoryCollectionViewCell")
 
         let xibName = UINib(nibName: "MediaTableViewCell", bundle: nil)
         mediaTableView.register(xibName, forCellReuseIdentifier: "MediaTableViewCell")
 
        let xib1Name = UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil)
        categoryCollectionView.register(xib1Name, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func assignDelegate() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        mediaTableView.delegate = self
        mediaTableView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    private func setupCollectionView() {
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.minimumLineSpacing = .zero
          flowLayout.minimumInteritemSpacing = 16
          flowLayout.scrollDirection = .horizontal
          flowLayout.sectionInset = .init(top: 5, left: 16, bottom: 5, right: 16)
       
    }
   
}


extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mediaTableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.identifier) as? MediaTableViewCell else { return UITableViewCell()}
        let row = media[indexPath.row]
        
        cell.titleLabel.text = row.mainTitle
        cell.informationLabel.text = row.subTitle
        cell.titleLabel.numberOfLines = 2
        return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350   }
}


extension HomeViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if section == 0 {
                return story.count
            } else {
                return items.count
            }
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView.tag == 0{
                if let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell {
                    
                    let row = story[indexPath.row]
                    cell.storyImage.image = row.mainImage
                    cell.storyNameLabel.text = row.title
                    return cell
                }
                return UICollectionViewCell()
            } else {
                if let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell {
                    cell.categoryLabel.text = items[indexPath.row]
                    return cell
                }
                return UICollectionViewCell()
            }
        }
    
    }
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}
extension HomeViewController: UICollectionViewDelegate {
    
    }
