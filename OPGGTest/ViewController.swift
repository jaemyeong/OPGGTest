import UIKit
import RxSwift

public class ViewController<View: UIView, ViewModel: AnyObject>: UIViewController {
    
    public var viewModel: ViewModel
    
    public var disposeBag: DisposeBag = DisposeBag()
    
    public var contentView: View {
        assert(self.view is View)
        return self.view as! View
    }
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func loadView() {
        self.view = View()
    }
}
