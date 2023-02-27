import UIKit

public final class AnyConfigurableCollectionViewItemIdentifier {
    
    private let value: AnyHashable
    
    private let configurator: (UICollectionViewCell) -> Void
    
    public let reuseIdentifier: String
    
    public init<T: ConfigurableCollectionViewItemIdentifier>(_ value: T) {
        self.value = AnyHashable(value)
        self.configurator = value.configure
        self.reuseIdentifier = value.reuseIdentifier
    }
}

extension AnyConfigurableCollectionViewItemIdentifier: ConfigurableCollectionViewItemIdentifier {
    
    public func configure(_ cell: UICollectionViewCell) {
        self.configurator(cell)
    }
}

extension AnyConfigurableCollectionViewItemIdentifier: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

extension AnyConfigurableCollectionViewItemIdentifier: Equatable {
    
    public static func == (lhs: AnyConfigurableCollectionViewItemIdentifier, rhs: AnyConfigurableCollectionViewItemIdentifier) -> Bool {
        lhs.value == rhs.value
    }
}
