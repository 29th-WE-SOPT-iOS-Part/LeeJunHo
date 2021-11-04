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
    @IBOutlet weak var HomeCategoryView: UICollectionView!
    @IBOutlet weak var CustomNavigationBar: CustomNavigationBar!
    
    var HomeTableViewContentList: [HomeTableViewContentData] = []
    var HomeCollectionViewContentList: [HomeCollectionViewContentData] = []
    var HomeCategoryViewContentList: [HomeCategoryViewContentData] = []
    var width: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeTableViewContentList()
        initHomeCollectionViewContentList()
        initHomeCategoryViewContentList()
        registerXib()
        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        HomeTableView.dataSource = self
        HomeTableView.delegate = self
        HomeCategoryView.dataSource = self
        HomeCategoryView.delegate = self
        CustomNavigationBar.delegate = self
    }
    
    func registerXib(){
        let xibTableViewName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        HomeTableView.register(xibTableViewName, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        let xibCollectionViewName = UINib(nibName: HomeVCCollectionViewCell.identifier, bundle: nil)
        HomeCollectionView.register(xibCollectionViewName, forCellWithReuseIdentifier: HomeVCCollectionViewCell.identifier)
        
        let xibCategoryViewName = UINib(nibName: HomeCategoryViewCell.identifier, bundle: nil)
        HomeCategoryView.register(xibCategoryViewName, forCellWithReuseIdentifier: HomeCategoryViewCell.identifier)
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
    
    func initHomeCategoryViewContentList() {
        let texts: [String] = ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"]
        
        let testLabel = UILabel(frame: .zero)
        testLabel.font = UIFont(name: "SF Pro display Regular", size:14)
        
        for txt in texts {
            print(width)
            width.append(("\(txt)" as! NSString).size(withAttributes: [NSAttributedString.Key.font : testLabel.font]).width)
        }
        
        HomeCategoryViewContentList.append(contentsOf: [
            HomeCategoryViewContentData(categoryText: "전체"),
            HomeCategoryViewContentData(categoryText: "오늘"),
            HomeCategoryViewContentData(categoryText: "이어서 시청하기"),
            HomeCategoryViewContentData(categoryText: "시청하지 않음"),
            HomeCategoryViewContentData(categoryText: "실시간"),
            HomeCategoryViewContentData(categoryText: "게시물"),
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
        if collectionView == HomeCollectionView{
            return HomeCollectionViewContentList.count
        }
        else {
            return HomeCategoryViewContentList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == HomeCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVCCollectionViewCell.identifier, for: indexPath) as? HomeVCCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setCollectionData(appData: HomeCollectionViewContentList[indexPath.row])

            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryViewCell.identifier, for: indexPath) as? HomeCategoryViewCell else {return UICollectionViewCell()}
            
            cell.setData(appData: HomeCategoryViewContentList[indexPath.row])
            cell.setUIConfiguration()
            cell.categoryLabel.frame.size.width = width[indexPath.row]+8
            
            return cell
        }

    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == HomeCollectionView{
            return CGSize(width: 72, height:104)
        }
        else {
            return CGSize(width: width[indexPath.row]+20, height:49)
        }
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


