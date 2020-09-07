//
//  ViewController.swift
//  humber-app
//
//  Created by Abzal Toremuratuly on 9/5/20.
//  Copyright © 2020 Abzal Toremuratuly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        markup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.rightBarButtonItems = [
            .init(title: "Add", style: .plain, target: self, action: #selector(addVC)),
            .init(title: "Present", style: .plain, target: self, action: #selector(presentVC))
        ]
    }
    
    @objc private func addVC() {
        let vc = ViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func presentVC() {
        let vc = ViewController()
        present(vc, animated: true)
    }
    
    private func markup() {
        view.backgroundColor = .purple
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .cyan
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let parentSize = view.bounds.size
        return .init(width: parentSize.width - 30, height: parentSize.height - 30)
    }
}
