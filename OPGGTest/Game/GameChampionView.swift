import UIKit

public final class GameChampionView: UIView {
    
    public let imageView: CircleImageView
    
    public override init(frame: CGRect) {
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
            self.imageView.widthAnchor.constraint(equalToConstant: 40.0),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
        ].map { constraint in
            constraint.priority = .defaultHigh + 1
            return constraint
        })
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 40.0, height: 40.0)
    }
}
