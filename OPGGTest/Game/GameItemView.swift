import UIKit
import OPGGTestAssets

public final class GameItemView: UIView {
    
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
        
        self.addConstraints([
            self.imageView.widthAnchor.constraint(equalToConstant: 24.0),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
        ])
        
        self.backgroundColor = .opggTestColor.paleGreyTwo.color
        self.clipsToBounds = true
        
        self.layer.cornerRadius = 4.0
        
        self.imageView.contentMode = .scaleAspectFill
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 24.0, height: 24.0)
    }
}
