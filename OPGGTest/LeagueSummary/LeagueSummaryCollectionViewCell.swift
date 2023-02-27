import UIKit
import RxSwift
import OPGGTestAssets

public final class LeagueSummaryCollectionViewCell: UICollectionViewCell {
    
    public static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()
    
    public var viewModel: LeagueSummaryViewModel? {
        didSet {
            self.disposeBag = DisposeBag()
            
            guard let viewModel = self.viewModel else {
                self.view.imageView.image = nil
                self.view.rankLabel.text = ""
                self.view.tierLabel.text = ""
                self.view.leaguePointLabel.text = .localizedStringWithFormat(NSLocalizedString("%d LP", comment: ""), 0)
                self.view.summaryLabel.text = .localizedStringWithFormat(NSLocalizedString("%d승 %d패 (%@)", comment: ""), 0, 0, Self.formatter.string(from: 0 as NSNumber)!)
                
                return
            }
            
            viewModel.image.asDriver().drive(self.view.imageView.rx.image).disposed(by: self.disposeBag)
            
            self.view.rankLabel.text = viewModel.rankName
            self.view.tierLabel.text = viewModel.tier
            self.view.leaguePointLabel.text = .localizedStringWithFormat(NSLocalizedString("%d LP", comment: ""), viewModel.leaguePoint)
            self.view.summaryLabel.text = .localizedStringWithFormat(NSLocalizedString("%d승 %d패 (%@)", comment: ""), viewModel.win, viewModel.lose, Self.formatter.string(from: (Double(viewModel.win) / Double(viewModel.win + viewModel.lose)) as NSNumber)!)
        }
    }
    
    public let view: LeagueSummaryView
    
    public var disposeBag: DisposeBag
    
    public override init(frame: CGRect) {
        self.view = LeagueSummaryView()
        self.disposeBag = DisposeBag()
        
        super.init(frame: frame)
        
        let contentView = self.contentView
        contentView.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            self.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            self.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4.0),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 4.0),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 8.0),
        ])
        
        self.view.layer.cornerRadius = 4.0
        self.view.layer.shadowColor = UIColor.opggTestColor.steelGrey.color?.cgColor
        self.view.layer.shadowOpacity = 0.2
        self.view.layer.shadowRadius = 6.0
        self.view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel = nil
    }
}
