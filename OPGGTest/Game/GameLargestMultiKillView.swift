import UIKit
import OPGGTestAssets

public final class GameLargestMultiKillView: UIView {
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.textLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 4.0),
            self.trailingAnchor.constraint(greaterThanOrEqualTo: self.textLabel.trailingAnchor, constant: 4.0),
        ])
        
        self.backgroundColor = .opggTestColor.white.color
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.opggTestColor.darkishPink.color?.cgColor
        
        self.textLabel.text = NSLocalizedString("Double Kill", comment: "")
        self.textLabel.textColor = .opggTestColor.darkishPink.color
        self.textLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
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
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 54.0, height: 20.0)
    }
}
