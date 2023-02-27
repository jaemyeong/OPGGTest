import UIKit

final class GamePerkView: UIView {
    
    let imageView: CircleImageView
    
    override init(frame: CGRect) {
        self.imageView = CircleImageView()
        
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
            self.imageView.widthAnchor.constraint(equalToConstant: 19.0),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 19.0, height: 19.0)
    }
}
