import UIKit

public final class GameView: UIView {
    
    public let resultView: GameResultView
    
    public let championView: GameChampionView
    
    public let badgeView: GameBadgeView
    
    public let itemsView: UIStackView
    
    public let spellsView: UIStackView
    
    public let perksView: UIStackView
    
    public let statsView: GameStatsView
    
    public let killRateView: GameKillRateView
    
    public let gameType: UILabel
    
    public let createDateLabel: UILabel
    
    public let largestMultiKillView: GameLargestMultiKillView
    
    public override init(frame: CGRect) {
        self.resultView = GameResultView()
        self.championView = GameChampionView()
        self.badgeView = GameBadgeView()
        self.itemsView = UIStackView(arrangedSubviews: [
            GameItemView(),
            GameItemView(),
            GameItemView(),
            GameItemView(),
            GameItemView(),
            GameItemView(),
            GameTrinketItemView(),
        ])
        self.spellsView = UIStackView(arrangedSubviews: [
            GameSpellView(),
            GameSpellView(),
        ])
        self.perksView = UIStackView(arrangedSubviews: [
            {
                let perkView = GamePerkView()
                perkView.imageView.backgroundColor = .black
                return perkView
            }(),
            GamePerkView(),
        ])
        self.statsView = GameStatsView()
        self.killRateView = GameKillRateView()
        self.gameType = UILabel()
        self.createDateLabel = UILabel()
        self.largestMultiKillView = GameLargestMultiKillView()
        
        super.init(frame: frame)
        
        self.addSubview(self.resultView)
        self.addSubview(self.championView)
        self.addSubview(self.badgeView)
        self.addSubview(self.spellsView)
        self.addSubview(self.perksView)
        self.addSubview(self.statsView)
        self.addSubview(self.killRateView)
        self.addSubview(self.itemsView)
        self.addSubview(self.gameType)
        self.addSubview(self.createDateLabel)
        self.addSubview(self.largestMultiKillView)
        
        self.resultView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.resultView.topAnchor.constraint(equalTo: self.topAnchor),
            self.resultView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: self.resultView.bottomAnchor),
        ])
        
        self.championView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.championView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            self.championView.leadingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: 16.0),
        ])
        
        self.badgeView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.badgeView.centerXAnchor.constraint(equalTo: self.championView.centerXAnchor),
            self.badgeView.centerYAnchor.constraint(equalTo: self.championView.bottomAnchor),
        ])
        
        self.spellsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.spellsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            self.spellsView.leadingAnchor.constraint(equalTo: self.championView.trailingAnchor, constant: 4.0),
        ])
        
        self.perksView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.perksView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            self.perksView.leadingAnchor.constraint(equalTo: self.spellsView.trailingAnchor, constant: 2.0),
        ])
        
        self.statsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.statsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18.0),
            self.statsView.leadingAnchor.constraint(equalTo: self.perksView.trailingAnchor, constant: 8.0),
        ])
        
        self.killRateView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.killRateView.topAnchor.constraint(equalTo: self.statsView.bottomAnchor, constant: 2.0),
            self.killRateView.leadingAnchor.constraint(equalTo: self.perksView.trailingAnchor, constant: 8.0),
        ])
        
        self.itemsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.itemsView.topAnchor.constraint(equalTo: self.championView.bottomAnchor, constant: 16.0),
            self.itemsView.topAnchor.constraint(equalTo: self.spellsView.bottomAnchor, constant: 16.0),
            self.itemsView.leadingAnchor.constraint(equalTo: self.resultView.trailingAnchor, constant: 16.0),
            self.bottomAnchor.constraint(equalTo: self.itemsView.bottomAnchor, constant: 16.0),
        ])
        
        self.gameType.translatesAutoresizingMaskIntoConstraints = false
        
        self.gameType.setContentCompressionResistancePriority(.defaultHigh - 1, for: .horizontal)
        self.gameType.setContentCompressionResistancePriority(.defaultHigh - 1, for: .vertical)
        
        self.addConstraints([
            self.gameType.topAnchor.constraint(equalTo: self.topAnchor, constant: 16.0),
            self.gameType.leadingAnchor.constraint(greaterThanOrEqualTo: self.statsView.trailingAnchor, constant: 14.0),
            self.trailingAnchor.constraint(equalTo: self.gameType.trailingAnchor, constant: 16.0),
        ])
        
        self.createDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            self.createDateLabel.topAnchor.constraint(equalTo: self.gameType.bottomAnchor, constant: 1.0),
            self.trailingAnchor.constraint(equalTo: self.createDateLabel.trailingAnchor, constant: 16.0),
        ])
        
        self.largestMultiKillView.translatesAutoresizingMaskIntoConstraints = false
        
        self.largestMultiKillView.setContentCompressionResistancePriority(.defaultHigh - 1, for: .horizontal)
        self.largestMultiKillView.setContentCompressionResistancePriority(.defaultHigh - 1, for: .vertical)
        
        self.addConstraints([
            self.largestMultiKillView.leadingAnchor.constraint(greaterThanOrEqualTo: self.itemsView.trailingAnchor, constant: 14.0),
            self.trailingAnchor.constraint(equalTo: self.largestMultiKillView.trailingAnchor, constant: 16.0),
            self.bottomAnchor.constraint(equalTo: self.largestMultiKillView.bottomAnchor, constant: 18.0),
        ])
        
        self.itemsView.spacing = 2.0
        
        self.spellsView.axis = .vertical
        self.spellsView.spacing = 2.0
        
        self.perksView.axis = .vertical
        self.perksView.spacing = 2.0
        
        self.gameType.text = "솔랭"
        self.gameType.textColor = .opggTestColor.coolGrey.color
        self.gameType.font = .systemFont(ofSize: 12.0, weight: .regular)
        
        self.createDateLabel.text = "0분 전"
        self.createDateLabel.textColor = .opggTestColor.coolGrey.color
        self.createDateLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
