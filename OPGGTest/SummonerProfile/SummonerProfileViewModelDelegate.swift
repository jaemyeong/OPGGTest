import Foundation

public protocol SummonerProfileViewModelDelegate: AnyObject {
    
    func onRefresh(in summonerProfileViewModel: SummonerProfileViewModel)
}
