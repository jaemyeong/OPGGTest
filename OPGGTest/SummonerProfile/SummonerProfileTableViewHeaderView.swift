import UIKit
import RxSwift
import OPGGTestAssets

public final class SummonerProfileTableViewHeaderView: UITableViewHeaderFooterView {
    
    public static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        return formatter
    }()
    
    public var viewModel: SummonerProfileViewModel? {
        didSet {
            self.disposeBag = DisposeBag()
            
            guard let viewModel = self.viewModel else {
                self.view.imageView.circleImageView.imageView.image = nil
                self.view.nameView.textLabel.text = ""
                self.view.levelView.textLabel.text = ""
                
                return
            }

            viewModel.profileImage.asDriver().drive(self.view.imageView.circleImageView.imageView.rx.image).disposed(by: self.disposeBag)
            
            self.view.nameView.textLabel.text = viewModel.name
            self.view.levelView.textLabel.text = Self.formatter.string(from: viewModel.level as NSNumber)
        }
    }
    
    let view: SummonerProfileView
    
    public var disposeBag: DisposeBag
    
    override init(reuseIdentifier: String?) {
        self.view = SummonerProfileView()
        self.disposeBag = DisposeBag()
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        let contentView = self.contentView
        
        contentView.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            self.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24.0),
            self.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16.0),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 24.0),
        ].map { constraint in
            constraint.priority = .defaultHigh + 1
            return constraint
        })
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .opggTestColor.white.color
        
        self.backgroundView = backgroundView
        
        self.view.refreshButton.addTarget(self, action: #selector(Self.refreshButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel = nil
    }
    
    @objc
    func refreshButtonTapped(_ sender: SummonerProfileRefreshButton) {
        self.viewModel?.onRefresh()
    }
}
