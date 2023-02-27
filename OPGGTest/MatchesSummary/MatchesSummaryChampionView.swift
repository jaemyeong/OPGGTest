import UIKit
import OPGGTestAssets

public final class MatchesSummaryChampionView: UIView {
    
    public let imageView: CircleImageView
    
    public let rateLabel: UILabel
    
    public override init(frame: CGRect) {
        self.imageView = CircleImageView()
        self.rateLabel = UILabel()
        
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [
            self.imageView,
            self.rateLabel,
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
        
        self.addConstraints([
            self.imageView.widthAnchor.constraint(equalToConstant: 30.0),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor),
        ].map { constraint in
            constraint.priority = .defaultHigh + 1
            return constraint
        })
        
        self.rateLabel.text = .localizedStringWithFormat(NSLocalizedString("%d%%", comment: ""), 0)
        self.rateLabel.textColor = .opggTestColor.darkGrey.color
        self.rateLabel.font = .systemFont(ofSize: 10.0, weight: .regular)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
