//
//  ViewController.swift
//  ScrollView
//
//  Created by Jae Ki Lee on 10/3/18.
//  Copyright © 2018 Jae Ki Lee. All rights reserved.
//

/*
 UIScrollView :
 scrollView 는 뷰가 스크롤 되는 것과 뷰가 줌 아웃 되는 것이 작동되도록 하는 기능입니다. scrollView는 손가락이 화면을 터치하고 움직이는 것을 감지합니다. 그러나 스크롤뷰는 유저의 손동작을 감지하여 아래, 위, 양옆으로 동작하는 것을 감지하지 뷰를 움직이는것을 직접적으로 작동시키지는 못합니다.
 그래서 스크롤 뷰는 contentView 가 필요합니다. scrollView 가 터치의 동작을 감지하면 contentView 가 움직이는 프로세스 입니다. 그러므로 뷰가 움직여서 멈추기가 가능하려면 contentView 의 사이즈를 명확히 알아야 합니다.(그래야 뷰가 어디서 부터 어디까지 가서 멈처야 하는지 인식을 하기 때문입니다.)
 
 사실 code로 ui 를 제작하게 되면 contentView 없이 scrollView에 view 를 넣어도 잘 작동합니다. 그러나 애플의 문서에 따르면 contentView를 넣어서 하라고 했으니 나중에 리젝트로 꼬투리 잡히지 않기 위해서 contentView를 추가 해서 합니다.
 */


import UIKit

class ViewController: UIViewController {
    
    // 1. scrollView and ContentView 생성 및 ViewDidLoad 에 등록
    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupViews()
    }
    
    //2.스크롤뷰 및 컨텐츠뷰 셋업
    func setupScrollView(){
        //translatesAutoresizingMaskIntoConstraints = false 를 안해주면 자동으로 autolayout 이 적용되므로, autolayout적용시 레이아웃이 꼬일수 있습니다 반드시 false 를 하세요.
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        //수퍼뷰에 스크롤뷰를 등록
        self.view.addSubview(scrollView)
        //스크롤뷰에 컨텐츠뷰를 등록
        scrollView.addSubview(contentView)
        
        //x,w,t,b 엑스좌표, 너비, 탑, 바텀 을 지정해주어야 합니다.
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        //x,w,t,b 엑스좌표, 너비, 탑, 바텀 을 지정해주어야 합니다.
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
    }
    
    //3.컨텐츠 안에 들어갈 뷰를 셋업 해줍니다.
    func setupViews(){
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        //x,w,t,b 엑스좌표, 너비, 탑, 바텀 을 지정해주어야 합니다.
        label1.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        //x,w,t,b 엑스좌표, 너비, 탑, 바텀 을 지정해주어야 합니다.
        label2.anchor(top: label1.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 100, paddingRight: 20, width: 0, height: 0)
    }
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.............."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


}

