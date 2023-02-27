import Foundation
import RxDataSources

extension ConfigurableTableViewSectionHeaderFooterIdentifier: IdentifiableType {
    
    public var identity: some Hashable {
        self
    }
}
