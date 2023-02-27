import UIKit
import OPGGTestAssets

public final class MainView: UIView {
    
    public let tableView: UITableView
    
    public override init(frame: CGRect) {
        self.tableView = UITableView()
        
        super.init(frame: frame)
        
        self.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            self.addConstraints([
                self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor),
                self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor),
            ])
        } else {
            self.addConstraints([
                self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
                self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor),
            ])
        }
        
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            self.backgroundColor = .opggTestColor.white.color
        }
        
        self.tableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) {
            self.tableView.sectionHeaderTopPadding = 0.0
        }
        
        self.tableView.register(SummonerProfileTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: SummonerProfileViewModel.reuseIdentifier)
        self.tableView.register(LeaguesSummaryTableViewCell.self, forCellReuseIdentifier: LeaguesSummaryViewModel.reuseIdentifier)
        self.tableView.register(MatchesSummaryTableViewCell.self, forCellReuseIdentifier: MatchesSummaryViewModel.reuseIdentifier)
        self.tableView.register(GameTableViewCell.self, forCellReuseIdentifier: GameViewModel.reuseIdentifier)
        self.tableView.register(SeparatorTableViewCell.self, forCellReuseIdentifier: SeparatorViewModel.reuseIdentifier)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
