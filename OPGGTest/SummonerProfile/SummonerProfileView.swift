import UIKit
import OPGGTestAssets

public final class SummonerProfileView: UIView {
    
    public let imageView: SummonerProfileImageView
    
    public let levelView: SummonerProfileLevelView
    
    public let nameView: SummonerProfileNameView
    
    public let refreshButton: SummonerProfileRefreshButton
    
    public override init(frame: CGRect) {
        self.imageView = SummonerProfileImageView()
        self.levelView = SummonerProfileLevelView()
        self.nameView = SummonerProfileNameView()
        self.refreshButton = SummonerProfileRefreshButton()
        
        super.init(frame: frame)
        
        self.addSubview(self.imageView)
        self.addSubview(self.levelView)
        self.addSubview(self.nameView)
        self.addSubview(self.refreshButton)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor),
        ])
        
        self.addConstraints([
            self.imageView.widthAnchor.constraint(equalToConstant: 88.0),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
        ].map { constraint in
            constraint.priority = .defaultHigh + 1
            return constraint
        })
        
        self.levelView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.levelView.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            self.levelView.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor),
        ])
        
        self.nameView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.nameView.topAnchor.constraint(equalTo: self.topAnchor),
            self.nameView.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 16.0),
            self.trailingAnchor.constraint(equalTo: self.nameView.trailingAnchor),
        ])
        
        self.refreshButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.refreshButton.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 16.0),
            self.bottomAnchor.constraint(equalTo: self.refreshButton.bottomAnchor),
        ])
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
