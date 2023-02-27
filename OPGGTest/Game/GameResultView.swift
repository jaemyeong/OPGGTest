import UIKit
import OPGGTestAssets

public final class GameResultView: UIView {
    
    public var result: GameResult = .draw {
        didSet {
            switch self.result {
            case .win:
                self.resultLabel.text = NSLocalizedString("승", comment: "")
                self.backgroundColor = .opggTestColor.softBlue.color
            case .lose:
                self.resultLabel.text = NSLocalizedString("패", comment: "")
                self.backgroundColor = .opggTestColor.darkishPink.color
            case .draw:
                self.resultLabel.text = NSLocalizedString("무", comment: "")
                self.backgroundColor = .opggTestColor.coolGrey.color
            }
        }
    }
    
    public let resultLabel: UILabel
    
    public let lengthLabel: UILabel
    
    public override init(frame: CGRect) {
        self.resultLabel = UILabel()
        self.lengthLabel = UILabel()
        
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [
            self.resultLabel,
            GameResultSeparator(),
            self.lengthLabel,
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 6.0
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        self.backgroundColor = .opggTestColor.coolGrey.color
        
        self.resultLabel.text = NSLocalizedString("무", comment: "")
        self.resultLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
        self.resultLabel.textColor = .opggTestColor.white.color
        
        self.lengthLabel.text = NSLocalizedString("00:00", comment: "")
        self.lengthLabel.font = .opggTestTextStyle.textStyle5.font
        self.lengthLabel.textColor = .opggTestColor.white.color
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 40.0, height: UIView.noIntrinsicMetric)
    }
}
