//
//  FirstVC.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/15.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var HomeCollectionView: UICollectionView!
    @IBOutlet weak var HomeTableView: UITableView!
    
    var HomeTableViewContentList: [HomeTableViewContentData] = []
    var HomeCollectionViewContentList: [HomeCollectionViewContentData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeTableViewContentList()
        initHomeCollectionViewContentList()
        registerXib()
        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        HomeTableView.dataSource = self
        HomeTableView.delegate = self
    }
    
    func registerXib(){
        let xibTableViewName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        HomeTableView.register(xibTableViewName, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        let xibCollectionViewName = UINib(nibName: HomeVCCollectionViewCell.identifier, bundle: nil)
        HomeCollectionView.register(xibCollectionViewName, forCellWithReuseIdentifier: HomeVCCollectionViewCell.identifier)
    }
    
    func initHomeTableViewContentList() {
        HomeTableViewContentList.append(contentsOf: [
            HomeTableViewContentData(title: "1차 iOS 세미나:iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환",subtitle: "WE SOPT ∙ 조회수 100만회 ∙ 3주 전"),
            HomeTableViewContentData(title: "2차 iOS 세미나:AutoLayout,StackView,TabBarController",subtitle: "WE SOPT ∙ 조회수 100만회 ∙ 3주 전"),
            HomeTableViewContentData(title: "3차 iOS 세미나:ScrollView,Delegate Pattern, TableView, CollectionView",subtitle: "WE SOPT ∙ 조회수 100만회 ∙ 3주 전"),
            HomeTableViewContentData(title: "4차 iOS 세미나: CoCoapods & Networking, REST API",subtitle: "WE SOPT ∙ 조회수 100만회 ∙ 3주 전"),
            HomeTableViewContentData(title: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화",subtitle: "WE SOPT ∙ 조회수 100만회 ∙ 3주 전")
        ])
    }
    
    func initHomeCollectionViewContentList() {
        HomeCollectionViewContentList.append(contentsOf: [
            HomeCollectionViewContentData(subscLabel: "iOSPart", imageName: "ggamju1"),
            HomeCollectionViewContentData(subscLabel: "AndroidPart", imageName: "ggamju2"),
            HomeCollectionViewContentData(subscLabel: "ServerPart", imageName: "ggamju3"),
            HomeCollectionViewContentData(subscLabel: "WebPart", imageName: "ggamju4"),
            HomeCollectionViewContentData(subscLabel: "DesignPart", imageName: "ggamju5"),
            HomeCollectionViewContentData(subscLabel: "PlanPart", imageName: "ggamju6")
        ])
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeTableViewContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {return UITableViewCell()}
        
        cell.setData(appData: HomeTableViewContentList[indexPath.row])
        return cell
    }
}


extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeCollectionViewContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVCCollectionViewCell.identifier, for: indexPath) as? HomeVCCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setCollectionData(appData: HomeCollectionViewContentList[indexPath.row])

        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height:104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
