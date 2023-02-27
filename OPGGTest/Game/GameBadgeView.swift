import UIKit
import OPGGTestAssets

public final class GameBadgeView: UIView {
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        self.backgroundColor = .opggTestColor.orangeYellow.color
        self.layer.borderColor = UIColor.opggTestColor.white.color?.cgColor
        self.layer.borderWidth = 1.0
        
        self.textLabel.font = .systemFont(ofSize: 10.0, weight: .bold)
        self.textLabel.textColor = .opggTestColor.white.color
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 32.0, height: 16.0)
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        guard layer == self.layer else {
            return
        }
        
        layer.cornerRadius = layer.bounds.height / 2.0
    }
}
