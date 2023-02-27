import UIKit
import OPGGTestAssets

public final class LeagueSummaryView: UIView {
    
    public let imageView: UIImageView
    
    public let rankLabel: UILabel
    
    public let tierLabel: UILabel
    
    public let leaguePointLabel: UILabel
    
    public let summaryLabel: UILabel
    
    public override init(frame: CGRect) {
        self.imageView = UIImageView()
        self.rankLabel = UILabel()
        self.tierLabel = UILabel()
        self.leaguePointLabel = UILabel()
        self.summaryLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.imageView)
        self.addSubview(self.rankLabel)
        self.addSubview(self.tierLabel)
        self.addSubview(self.leaguePointLabel)
        self.addSubview(self.summaryLabel)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18.0),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
            self.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 18.0),
        ].map { constraint in
            constraint.priority = .defaultHigh + 1
            return constraint
        })
        
        self.addConstraints([
            self.imageView.widthAnchor.constraint(equalToConstant: 64.0),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
        ].map { constraint in
            constraint.priority = .defaultHigh + 1
            return constraint
        })
        
        self.rankLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.rankLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            self.rankLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 8.0),
        ])
        
        self.tierLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.tierLabel.topAnchor.constraint(equalTo: self.rankLabel.bottomAnchor, constant: 1.0),
            self.tierLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 8.0),
        ])
        
        self.leaguePointLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.leaguePointLabel.topAnchor.constraint(equalTo: self.tierLabel.bottomAnchor, constant: 2.0),
            self.leaguePointLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 8.0),
        ])
        
        self.summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.summaryLabel.topAnchor.constraint(equalTo: self.leaguePointLabel.bottomAnchor, constant: 2.0),
            self.summaryLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 8.0),
        ])
        
        self.backgroundColor = .opggTestColor.white.color
        
        self.rankLabel.text = NSLocalizedString("Rank Name", comment: "")
        self.rankLabel.textColor = .opggTestColor.softBlue.color
        self.rankLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        
        self.tierLabel.text = NSLocalizedString("Tier", comment: "")
        self.tierLabel.textColor = .opggTestColor.darkGrey.color
        self.tierLabel.font = .opggTestTextStyle.textStyle3.font
        
        self.leaguePointLabel.text = .localizedStringWithFormat(NSLocalizedString("%d LP", comment: ""), 0)
        self.leaguePointLabel.textColor = .opggTestColor.darkGrey.color
        self.leaguePointLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        
        self.summaryLabel.text = .localizedStringWithFormat(NSLocalizedString("%d승 %d패 (%d%%)", comment: ""), 0, 0, 0)
        self.summaryLabel.textColor = .opggTestColor.steelGrey.color
        self.summaryLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 272.0, height: 100.0)
    }
}
