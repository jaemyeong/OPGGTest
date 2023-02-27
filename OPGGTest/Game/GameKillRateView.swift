import UIKit
import OPGGTestAssets

public final class GameKillRateView: UIView {
    
    public var killRate: String {
        didSet {
            self.updateTextLabel()
        }
    }
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.killRate = "0%"
        
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
        
        self.textLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        self.textLabel.textColor = .opggTestColor.gunmetal.color
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func updateTextLabel() {
        self.textLabel.text = .localizedStringWithFormat(NSLocalizedString("킬관여 %@", comment: ""), self.killRate)
    }
}
