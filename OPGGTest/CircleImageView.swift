import UIKit
import OPGGTestAssets

public final class CircleImageView: UIView {
    
    public let imageView: UIImageView
    
    public override init(frame: CGRect) {
        self.imageView = UIImageView()
        
        super.init(frame: frame)
        
        self.addSubview(self.imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor),
        ])
        
        self.backgroundColor = .opggTestColor.paleGreyTwo.color
        self.clipsToBounds = true
        
        self.imageView.contentMode = .scaleAspectFill
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        guard layer == self.layer else {
            return
        }
        
        layer.cornerRadius = min(layer.bounds.width, layer.bounds.height) / 2.0
    }
}
