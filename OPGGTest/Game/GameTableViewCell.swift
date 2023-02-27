import UIKit
import OPGGTestAssets
import RxSwift

public final class GameTableViewCell: UITableViewCell {
    
    public var viewModel: GameViewModel? {
        didSet {
            self.disposeBag = DisposeBag()
            
            guard let viewModel = self.viewModel else {
                self.view.championView.imageView.imageView.image = nil
                self.view.resultView.result = .draw
                return
            }
            
            viewModel.championImage.asDriver().drive(self.view.championView.imageView.imageView.rx.image).disposed(by: self.disposeBag)
            
            viewModel.itemsImage.asDriver().drive(with: self) { object, element in
                element.enumerated().forEach { offset, element in
                    guard let itemView = object.view.itemsView.arrangedSubviews[offset] as? GameItemView else {
                        return
                    }
                    itemView.imageView.image = element
                }
            }
            .disposed(by: self.disposeBag)
            
            viewModel.spellsImage.asDriver().drive(with: self) { object, element in
                element.enumerated().forEach { offset, element in
                    guard let itemView = object.view.spellsView.arrangedSubviews[offset] as? GameSpellView else {
                        return
                    }
                    itemView.imageView.image = element
                }
            }
            .disposed(by: self.disposeBag)
            
            if let trinketItemView = self.view.itemsView.arrangedSubviews.last as? GameTrinketItemView {
                viewModel.trinketItemImage.asDriver().drive(trinketItemView.imageView.imageView.rx.image).disposed(by: self.disposeBag)
            }
            
            viewModel.peakImage.asDriver().drive(with: self) { object, element in
                element.enumerated().forEach { offset, element in
                    guard let itemView = object.view.perksView.arrangedSubviews[offset] as? GamePerkView else {
                        return
                    }
                    itemView.imageView.imageView.image = element
                }
            }
            .disposed(by: self.disposeBag)
            
            self.view.resultView.result = viewModel.isWin ? .win : .lose
            self.view.statsView.kill = viewModel.kill
            self.view.statsView.death = viewModel.death
            self.view.statsView.assist = viewModel.assist
            self.view.killRateView.textLabel.text = .localizedStringWithFormat(NSLocalizedString("킬관여 %@", comment: ""), viewModel.killRate)
            self.view.gameType.text = viewModel.gameType
            self.view.createDateLabel.text = .localizedStringWithFormat("%d분 전", Int((viewModel.createDate.timeIntervalSinceNow / -60.0).rounded()))
            
            self.view.largestMultiKillView.textLabel.text = viewModel.largestMultiKillString
            self.view.largestMultiKillView.isHidden = viewModel.largestMultiKillString.isEmpty
            
            self.view.badgeView.textLabel.text = viewModel.opScoreBadge
            self.view.badgeView.isHidden = viewModel.opScoreBadge.isEmpty
            
            self.view.resultView.lengthLabel.text = .localizedStringWithFormat(NSLocalizedString("%02d:%02d", comment: ""), Int((viewModel.gameLength / 60).rounded()), Int(viewModel.gameLength) % 60)
        }
    }
    
    public let view: GameView
    
    public var disposeBag: DisposeBag
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.view = GameView()
        self.disposeBag = DisposeBag()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let contentView = self.contentView
        
        contentView.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints([
            self.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.selectionStyle = .none
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel = nil
    }
}
