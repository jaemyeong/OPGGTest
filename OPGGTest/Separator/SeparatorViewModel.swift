import UIKit

public final class SeparatorViewModel: ConfigurableTableViewItemIdentifier {
    
    public func configure(_ cell: UITableViewCell) {}
}

extension SeparatorViewModel: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension SeparatorViewModel: Equatable {
    
    public static func == (lhs: SeparatorViewModel, rhs: SeparatorViewModel) -> Bool {
        lhs === rhs
    }
}
