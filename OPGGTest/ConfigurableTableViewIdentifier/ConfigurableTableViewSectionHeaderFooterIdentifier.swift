import Foundation

public final class ConfigurableTableViewSectionHeaderFooterIdentifier {
    
    public var headerIdentifier: AnyConfigurableTableViewSectionIdentifier?
    
    public var footerIdentifier: AnyConfigurableTableViewSectionIdentifier?
    
    public init(headerIdentifier: AnyConfigurableTableViewSectionIdentifier? = nil, footerIdentifier: AnyConfigurableTableViewSectionIdentifier? = nil) {
        self.headerIdentifier = headerIdentifier
        self.footerIdentifier = footerIdentifier
    }
}

extension ConfigurableTableViewSectionHeaderFooterIdentifier: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.headerIdentifier)
        hasher.combine(self.footerIdentifier)
    }
}

extension ConfigurableTableViewSectionHeaderFooterIdentifier: Equatable {
    
    public static func == (lhs: ConfigurableTableViewSectionHeaderFooterIdentifier, rhs: ConfigurableTableViewSectionHeaderFooterIdentifier) -> Bool {
        lhs.headerIdentifier == rhs.headerIdentifier &&
        lhs.footerIdentifier == rhs.footerIdentifier
    }
}
