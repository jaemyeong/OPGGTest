import UIKit
import OPGGTestAssets

public final class SummonerProfileImageView: UIView {
    
    public let circleImageView: CircleImageView
    
    public override init(frame: CGRect) {
        self.circleImageView = CircleImageView()
        
        super.init(frame: frame)
        
        self.addSubview(self.circleImageView)
        
        self.circleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.circleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.circleImageView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.circleImageView.bottomAnchor),
        ])
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 88.0, height: 88.0)
    }
}
