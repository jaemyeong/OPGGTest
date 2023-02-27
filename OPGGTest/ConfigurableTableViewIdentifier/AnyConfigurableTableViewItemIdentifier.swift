import UIKit

public final class AnyConfigurableTableViewItemIdentifier {
    
    private let value: AnyHashable
    
    private let configurator: (UITableViewCell) -> Void
    
    public let reuseIdentifier: String
    
    init<T: ConfigurableTableViewItemIdentifier>(_ value: T) {
        self.value = AnyHashable(value)
        self.reuseIdentifier = value.reuseIdentifier
        self.configurator = value.configure
    }
}

extension AnyConfigurableTableViewItemIdentifier: ConfigurableTableViewItemIdentifier {
    
    public func configure(_ cell: UITableViewCell) {
        self.configurator(cell)
    }
}

extension AnyConfigurableTableViewItemIdentifier: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

extension AnyConfigurableTableViewItemIdentifier: Equatable {
    
    public static func == (lhs: AnyConfigurableTableViewItemIdentifier, rhs: AnyConfigurableTableViewItemIdentifier) -> Bool {
        lhs.value == rhs.value
    }
}
