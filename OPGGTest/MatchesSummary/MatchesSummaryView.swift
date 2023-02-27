import UIKit
import OPGGTestAssets

public final class MatchesSummaryView: UIView {
    
    public let titleLabel: UILabel
    
    public let summaryLabel: UILabel
    
    public let statsView: MatchesSummaryStatsView
    
    public let rateView: MatchesSummaryRateView
    
    public let positionView: MatchesSummaryPositionView
    
    public let championsView: MatchesSummaryChampionsView
    
    public override init(frame: CGRect) {
        self.titleLabel = UILabel()
        self.summaryLabel = UILabel()
        self.statsView = MatchesSummaryStatsView()
        self.rateView = MatchesSummaryRateView()
        self.positionView = MatchesSummaryPositionView()
        self.championsView = MatchesSummaryChampionsView()
        
        super.init(frame: frame)
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.summaryLabel)
        self.addSubview(self.statsView)
        self.addSubview(self.rateView)
        self.addSubview(self.positionView)
        self.addSubview(self.championsView)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
        ])
        
        self.summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.summaryLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8.0),
            self.summaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
        ])
        
        self.statsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.statsView.topAnchor.constraint(equalTo: self.summaryLabel.bottomAnchor, constant: 2.0),
            self.statsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
        ])
        
        self.rateView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.rateView.topAnchor.constraint(equalTo: self.statsView.bottomAnchor, constant: 2.0),
            self.rateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
        ])
        
        self.positionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.positionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.positionView.leadingAnchor.constraint(equalTo: self.championsView.trailingAnchor),
            self.trailingAnchor.constraint(equalTo: self.positionView.trailingAnchor, constant: 12.0),
            self.bottomAnchor.constraint(equalTo: self.positionView.bottomAnchor, constant: 12.0),
        ])
        
        self.championsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.championsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.bottomAnchor.constraint(equalTo: self.championsView.bottomAnchor, constant: 12.0),
        ])
        
        self.backgroundColor = .opggTestColor.white.color
        
        self.titleLabel.text = NSLocalizedString("최근 20게임 분석", comment: "")
        self.titleLabel.textColor = .opggTestColor.coolGrey.color
        self.titleLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
        
        self.summaryLabel.text = .localizedStringWithFormat(NSLocalizedString("%d승 %d패", comment: ""), 0, 0)
        self.summaryLabel.textColor = .opggTestColor.coolGrey.color
        self.summaryLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 90.0)
    }
}
