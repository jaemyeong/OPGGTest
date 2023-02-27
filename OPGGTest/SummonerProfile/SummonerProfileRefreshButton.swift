import UIKit
import OPGGTestAssets

public final class SummonerProfileRefreshButton: UIControl {
    
    public let textLabel: UILabel
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 100.0, height: 40.0)
    }
    
    public override init(frame: CGRect) {
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.textLabel.trailingAnchor),
            self.textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        self.backgroundColor = .opggTestColor.softBlue.color
        
        self.textLabel.text = NSLocalizedString("전적갱신", comment: "")
        self.textLabel.textColor = .opggTestColor.white.color
        self.textLabel.font = .systemFont(ofSize: 14.0)
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
