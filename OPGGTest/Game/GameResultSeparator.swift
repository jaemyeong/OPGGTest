import UIKit
import OPGGTestAssets

final class GameResultSeparator: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .opggTestColor.white.color?.withAlphaComponent(0.4)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 16.0, height: 1.0)
    }
}
