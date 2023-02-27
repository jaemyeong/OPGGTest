import UIKit
import OPGGTestAssets

public final class GameStatsView: UIView {
    
    public var kill: Int {
        didSet {
            self.updateTextLabel()
        }
    }
    
    public var death: Int {
        didSet {
            self.updateTextLabel()
        }
    }
    
    public var assist: Int {
        didSet {
            self.updateTextLabel()
        }
    }
    
    public let textLabel: UILabel
    
    public override init(frame: CGRect) {
        self.kill = 0
        self.death = 0
        self.assist = 0
        
        self.textLabel = UILabel()
        
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.textLabel.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.textLabel.bottomAnchor),
        ])
        
        self.updateTextLabel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func updateTextLabel() {
        let attributedText = NSMutableAttributedString()
        
        attributedText.append(NSAttributedString(string: "\(self.kill)", attributes: [
            .font: UIFont.systemFont(ofSize: 16.0, weight: .bold),
            .foregroundColor: UIColor.opggTestColor.darkGrey.color ?? .black
        ]))
        
        attributedText.append(NSAttributedString(string: " / ", attributes: [
            .font: UIFont.systemFont(ofSize: 16.0, weight: .regular),
            .foregroundColor: UIColor.opggTestColor.darkGrey.color ?? .black
        ]))
        
        attributedText.append(NSAttributedString(string: "\(self.death)", attributes: [
            .font: UIFont.systemFont(ofSize: 16.0, weight: .bold),
            .foregroundColor: UIColor.opggTestColor.darkishPink.color ?? .black
        ]))
        
        attributedText.append(NSAttributedString(string: " / ", attributes: [
            .font: UIFont.systemFont(ofSize: 16.0, weight: .regular),
            .foregroundColor: UIColor.opggTestColor.darkGrey.color ?? .black
        ]))
        
        attributedText.append(NSAttributedString(string: "\(self.assist)", attributes: [
            .font: UIFont.systemFont(ofSize: 16.0, weight: .bold),
            .foregroundColor: UIColor.opggTestColor.darkGrey.color ?? .red
        ]))
        
        self.textLabel.attributedText = attributedText
    }
}
