import UIKit
import OPGGTestAssets

public final class MatchesSummaryTableViewCell: UITableViewCell {
    
    public static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    public var viewModel: MatchesSummaryViewModel? {
        didSet {
            guard let viewModel = self.viewModel else {
                return
            }
            
            self.view.summaryLabel.text = .localizedStringWithFormat(NSLocalizedString("%d승 %d패", comment: ""), viewModel.win, viewModel.lose)
            self.view.statsView.kill = Double(viewModel.kills)
            self.view.statsView.death = Double(viewModel.deaths)
            self.view.statsView.assist = Double(viewModel.assists)
            self.view.rateView.rate = .localizedStringWithFormat(NSLocalizedString("%@:1", comment: ""), Self.formatter.string(from: (Double(viewModel.kills + viewModel.assists) / Double(viewModel.assists)) as NSNumber)!)
            
            
            self.view.positionView.imageView.image = .opggTestImage.iconLoLBot.image
        }
    }
    
    public let view: MatchesSummaryView
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.view = MatchesSummaryView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let contentView = self.contentView
        
        contentView.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            self.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            self.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.selectionStyle = .none
        
        self.view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.view.layer.shadowRadius = 2.0
        self.view.layer.shadowColor = UIColor.opggTestColor.steelGrey.color?.cgColor
        self.view.layer.shadowOpacity = 0.1
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel = nil
    }
}
