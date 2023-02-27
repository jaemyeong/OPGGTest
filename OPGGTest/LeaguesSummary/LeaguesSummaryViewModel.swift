import UIKit

public final class LeaguesSummaryViewModel: ConfigurableTableViewItemIdentifier {
    
    public let items: [LeagueSummaryViewModel]
    
    public init(items: [LeagueSummaryViewModel]) {
        self.items = items
    }
    
    public func configure(_ cell: UITableViewCell) {
        guard let cell = cell as? LeaguesSummaryTableViewCell else {
            return
        }
        cell.viewModel = self
    }
}

extension LeaguesSummaryViewModel: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension LeaguesSummaryViewModel: Equatable {
    
    public static func == (lhs: LeaguesSummaryViewModel, rhs: LeaguesSummaryViewModel) -> Bool {
        lhs === rhs
    }
}
