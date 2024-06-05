//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Can on 26.01.2024.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifer = "CollectionViewTableViewCell"
    
    private var titles: [Title] = [Title]()
    
    private var list: [String] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifer)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
       return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        
    }
    
    func configureList(_ list: [String]?) {
        guard let list else { return }
        self.list = list
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    public func configure(with titles: [Title]){
        self.titles = titles
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}

extension CollectionViewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifer, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        
        guard let model = titles[indexPath.row].poster_path else { return UICollectionViewCell() }
        
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    

    
}
