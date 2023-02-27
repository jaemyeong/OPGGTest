import UIKit
import OPGGTestAssets

public final class SeparatorView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .opggTestColor.paleGreyTwo.color
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 4.0)
    }
}
