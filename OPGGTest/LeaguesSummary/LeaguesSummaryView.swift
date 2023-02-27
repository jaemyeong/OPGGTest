import UIKit
import OPGGTestAssets

public final class LeaguesSummaryView: UIView {
    
    public let collectionView: UICollectionView
    
    public override init(frame: CGRect) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.minimumInteritemSpacing = 0.0
        collectionViewLayout.minimumLineSpacing = 0.0
        
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.collectionView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
        ])
        
        self.collectionView.register(LeagueSummaryCollectionViewCell.self, forCellWithReuseIdentifier: LeagueSummaryViewModel.reuseIdentifier)
        self.collectionView.backgroundColor = .opggTestColor.white.color
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 12.0)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 116.0)
    }
}
