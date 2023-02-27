import UIKit

public final class MatchesSummaryViewModel: ConfigurableTableViewItemIdentifier {
    
    public let win: Int
    
    public let lose: Int
    
    public let kills: Int
    
    public let deaths: Int
    
    public let assists: Int
    
    public init(win: Int, lose: Int, kills: Int, deaths: Int, assists: Int) {
        self.win = win
        self.lose = lose
        self.kills = kills
        self.deaths = deaths
        self.assists = assists
    }
    
    public func configure(_ cell: UITableViewCell) {
        guard let cell = cell as? MatchesSummaryTableViewCell else {
            return
        }
        cell.viewModel = self
    }
}

extension MatchesSummaryViewModel: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension MatchesSummaryViewModel: Equatable {
    
    public static func == (lhs: MatchesSummaryViewModel, rhs: MatchesSummaryViewModel) -> Bool {
        lhs === rhs
    }
}
