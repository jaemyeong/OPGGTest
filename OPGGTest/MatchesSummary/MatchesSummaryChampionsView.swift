import UIKit
import OPGGTestAssets

public final class MatchesSummaryChampionsView: UIView {
    
    public let titleLabel: UILabel
    
    public let stackView: UIStackView
    
    public override init(frame: CGRect) {
        self.titleLabel = UILabel()
        self.stackView = UIStackView(arrangedSubviews: [
            MatchesSummaryChampionView(),
            MatchesSummaryChampionView(),
        ])
        
        super.init(frame: frame)
        
        self.stackView.spacing = 16.0
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.stackView)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor)
        ])
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.stackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8.0),
            self.stackView.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            self.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
        ])
        
        self.titleLabel.text = NSLocalizedString("모스트 승률", comment: "")
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = .opggTestColor.coolGrey.color
        self.titleLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 98.0, height: UIView.noIntrinsicMetric)
    }
}
