import Foundation
import RxDataSources

extension AnyConfigurableTableViewItemIdentifier: IdentifiableType {
    
    public var identity: some Hashable {
        self
    }
}
