import UIKit
import OPGGTestAssets

public final class SummonerProfileLevelView: UIView {
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        
        self.addConstraints([
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: 38.0),
        ])
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            self.trailingAnchor.constraint(equalTo: self.textLabel.trailingAnchor, constant: 8.0),
            self.bottomAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 5.0),
        ])
        
        self.backgroundColor = .opggTestColor.darkGrey90.color
        
        self.textLabel.text = "0"
        self.textLabel.textColor = .opggTestColor.white.color
        self.textLabel.font = .opggTestTextStyle.textStyle5.font
        self.textLabel.textAlignment = .center
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        guard layer == self.layer else {
            return
        }
        
        layer.cornerRadius = layer.bounds.height / 2.0
    }
}
