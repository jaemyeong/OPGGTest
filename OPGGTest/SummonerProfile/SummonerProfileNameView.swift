import UIKit
import OPGGTestAssets

public final class SummonerProfileNameView: UIView {
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
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
        
        self.textLabel.text = NSLocalizedString("Name", comment: "")
        self.textLabel.font = .opggTestTextStyle.textStyle2.font
        self.textLabel.textColor = .opggTestColor.darkGrey.color
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
