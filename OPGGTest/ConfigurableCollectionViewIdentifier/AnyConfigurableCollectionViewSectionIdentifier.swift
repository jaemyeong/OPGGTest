import UIKit

public final class AnyConfigurableCollectionViewSectionIdentifier {
    
    private let value: AnyHashable
    
    private let configurator: (UICollectionReusableView) -> Void
    
    public let reuseIdentifier: String
    
    public init<T: ConfigurableCollectionViewSectionIdentifier>(_ value: T) {
        self.value = AnyHashable(value)
        self.configurator = value.configure
        self.reuseIdentifier = value.reuseIdentifier
    }
}

extension AnyConfigurableCollectionViewSectionIdentifier: ConfigurableCollectionViewSectionIdentifier {
    
    public func configure(_ reusableView: UICollectionReusableView) {
        self.configurator(reusableView)
    }
}

extension AnyConfigurableCollectionViewSectionIdentifier: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

extension AnyConfigurableCollectionViewSectionIdentifier: Equatable {
    
    public static func == (lhs: AnyConfigurableCollectionViewSectionIdentifier, rhs: AnyConfigurableCollectionViewSectionIdentifier) -> Bool {
        lhs.value == rhs.value
    }
}
