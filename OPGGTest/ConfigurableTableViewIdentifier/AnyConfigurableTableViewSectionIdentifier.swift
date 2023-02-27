import UIKit

public final class AnyConfigurableTableViewSectionIdentifier {
    
    private let value: AnyHashable
    
    private let configurator: (UITableViewHeaderFooterView) -> Void
    
    public let reuseIdentifier: String
    
    public init<T: ConfigurableTableViewSectionIdentifier>(_ value: T) {
        self.value = AnyHashable(value)
        self.reuseIdentifier = value.reuseIdentifier
        self.configurator = value.configure
    }
}

extension AnyConfigurableTableViewSectionIdentifier: ConfigurableTableViewSectionIdentifier {
    
    public func configure(_ headerFooterView: UITableViewHeaderFooterView) {
        self.configurator(headerFooterView)
    }
}

extension AnyConfigurableTableViewSectionIdentifier: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

extension AnyConfigurableTableViewSectionIdentifier: Equatable {
    
    public static func == (lhs: AnyConfigurableTableViewSectionIdentifier, rhs: AnyConfigurableTableViewSectionIdentifier) -> Bool {
        lhs.value == rhs.value
    }
}
