//
//  FirstVC.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/15.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var HomeTableView: UITableView!
    
    var HomeTableViewContentList: [HomeTableViewContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeTableViewContentList()
        registerXib()
        HomeTableView.dataSource = self
        HomeTableView.delegate = self

    }
    
    func registerXib(){
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        HomeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
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
