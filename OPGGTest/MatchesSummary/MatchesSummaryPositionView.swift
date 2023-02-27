import UIKit
import OPGGTestAssets

public final class MatchesSummaryPositionView: UIView {
    
    public let titleLabel: UILabel
    
    public let imageView: UIImageView
    
    public let rateLabel: UILabel
    
    public override init(frame: CGRect) {
        self.titleLabel = UILabel()
        self.imageView = UIImageView()
        self.rateLabel = UILabel()
        
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            self.imageView,
            self.rateLabel,
        ])
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
        
        self.imageView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        self.imageView.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        
        self.titleLabel.text = NSLocalizedString("포지션", comment: "")
        self.titleLabel.textColor = .opggTestColor.coolGrey.color
        self.titleLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
        
        self.imageView.image = .opggTestImage.iconLoLAll.image
        self.imageView.contentMode = .scaleAspectFit
        
        self.rateLabel.text = .localizedStringWithFormat(NSLocalizedString("%d%%", comment: ""), 0)
        self.rateLabel.textColor = .opggTestColor.darkGrey.color
        self.rateLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 64.0, height: UIView.noIntrinsicMetric)
    }
}
