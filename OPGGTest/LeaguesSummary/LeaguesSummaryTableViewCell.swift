import UIKit
import OPGGTestAssets

final class LeaguesSummaryTableViewCell: UITableViewCell {
    
    var viewModel: LeaguesSummaryViewModel? {
        didSet {
            self.view.collectionView.reloadData()
        }
    }
    
    let view: LeaguesSummaryView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.view = LeaguesSummaryView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let contentView = self.contentView
        
        contentView.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            self.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.selectionStyle = .none
        
        self.view.collectionView.delegate = self
        self.view.collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel = nil
    }
}

extension LeaguesSummaryTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemIdentifier = self.viewModel!.items[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier.reuseIdentifier, for: indexPath)
        
        itemIdentifier.configure(cell)
        
        return cell
    }
}

extension LeaguesSummaryTableViewCell: UICollectionViewDelegate {}

extension LeaguesSummaryTableViewCell: UICollectionViewDelegateFlowLayout {}
