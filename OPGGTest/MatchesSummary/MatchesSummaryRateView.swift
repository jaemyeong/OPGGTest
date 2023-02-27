import UIKit
import OPGGTestAssets

public final class MatchesSummaryRateView: UIView {
    
    public var rate: String {
        didSet {
            self.updateTextLabel()
        }
    }
    
    public var contributionForKillRate: String {
        didSet {
            self.updateTextLabel()
        }
    }
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.rate = "0.00:1"
        self.contributionForKillRate = "0%"
        
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.textLabel.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.textLabel.bottomAnchor),
        ])
        
        self.updateTextLabel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func updateTextLabel() {
        let attributedText = NSMutableAttributedString()
        
        attributedText.append(NSAttributedString(string: "\(self.rate)", attributes: [
            .font: UIFont.systemFont(ofSize: 10.0, weight: .regular),
            .foregroundColor: UIColor.opggTestColor.greenBlue.color ?? .black
        ]))
        
        attributedText.append(NSAttributedString(string: " ", attributes: [
            .font: UIFont.systemFont(ofSize: 10.0, weight: .regular),
            .foregroundColor: UIColor.black
        ]))
        
        attributedText.append(NSAttributedString(string: "(\(self.contributionForKillRate))", attributes: [
            .font: UIFont.systemFont(ofSize: 10.0, weight: .regular),
            .foregroundColor: UIColor.opggTestColor.darkishPink.color ?? .black
        ]))
        
        self.textLabel.attributedText = attributedText
    }
}
