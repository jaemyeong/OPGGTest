import UIKit
import OPGGTestAPIKit
import Collections
import RxSwift
import RxCocoa

public final class MainViewModel {
    
    var summonerName: String
    
    var items: BehaviorRelay<OrderedDictionary<ConfigurableTableViewSectionHeaderFooterIdentifier, [AnyConfigurableTableViewItemIdentifier]>>
    
    var lastMatch: TimeInterval?
    
    var isLoading: Bool
    
    init() {
        self.summonerName = "진재명"
        self.items = BehaviorRelay(value: [:])
        self.lastMatch = nil
        self.isLoading = false
        
        self.refresh()
    }
    
    func refresh() {
        OPGGTestAPIProvider.shared.request(target: .summoner(name: self.summonerName), mappableType: Summoner.self) { result in
            switch result {
            case .success(let value):
                self.lastMatch = nil
                
                self.items.accept([
                    ConfigurableTableViewSectionHeaderFooterIdentifier(
                        headerIdentifier: AnyConfigurableTableViewSectionIdentifier(
                            SummonerProfileViewModel(
                                profileImageURL: value.profileImageURL,
                                level: value.level,
                                name: value.name,
                                delegate: self
                            )
                        )
                    ): [
                        AnyConfigurableTableViewItemIdentifier(
                            LeaguesSummaryViewModel(items: value.leagues.map { league in
                                LeagueSummaryViewModel(
                                    rankName: league.tierRank.name,
                                    tier: league.tierRank.tier,
                                    leaguePoint: league.tierRank.lp,
                                    win: league.wins,
                                    lose: league.losses,
                                    imageURL: league.tierRank.imageURL
                                )
                            })
                        ),
                    ]
                ])
                
                self.loadMore()
            case .failure(let error):
                logger.error("\(error)")
            }
        }
    }
    
    func loadMore() {
        guard !self.isLoading else {
            return
        }
        
        OPGGTestAPIProvider.shared.request(target: .matches(name: self.summonerName, lastMatch: self.lastMatch), mappableType: Matches.self) { result in
            switch result {
            case .success(let value):
                if self.lastMatch != nil {
                    var items = self.items.value
                    
                    guard !items.elements.isEmpty else {
                        self.items.accept([:])
                        return
                    }
                    
                    items[items.elements[0].key]?.append(contentsOf: value.games.flatMap { game in
                        return [
                            AnyConfigurableTableViewItemIdentifier(SeparatorViewModel()),
                            AnyConfigurableTableViewItemIdentifier(
                                GameViewModel(
                                    isWin: game.isWin,
                                    kill: game.stats.general.kill,
                                    death: game.stats.general.death,
                                    assist: game.stats.general.assist,
                                    killRate: game.stats.general.contributionForKillRate,
                                    gameType: game.gameType,
                                    createDate: game.createDate,
                                    championImageURL: game.champion.imageURL,
                                    itemsImageURL: game.items.map(\.imageURL),
                                    spellsImageURL: game.spells.map(\.imageURL),
                                    peakURL: game.peak,
                                    largestMultiKillString: game.stats.general.largestMultiKillString,
                                    opScoreBadge: game.stats.general.opScoreBadge,
                                    gameLength: game.gameLength
                                )
                            ),
                        ]
                    })
                    
                    self.lastMatch = value.games.last?.createDate.timeIntervalSince1970
                    
                    self.items.accept(items)
                } else {
                    var items = self.items.value
                    
                    guard !items.elements.isEmpty else {
                        self.items.accept([:])
                        return
                    }
                    
                    items[items.elements[0].key]?.append(
                        AnyConfigurableTableViewItemIdentifier(
                            MatchesSummaryViewModel(
                                win: value.summary.wins,
                                lose: value.summary.losses,
                                kills: value.summary.kills,
                                deaths: value.summary.deaths,
                                assists: value.summary.assists
                            )
                        )
                    )
                    
                    items[items.elements[0].key]?.append(contentsOf: value.games.flatMap { game in
                        return [
                            AnyConfigurableTableViewItemIdentifier(SeparatorViewModel()),
                            AnyConfigurableTableViewItemIdentifier(
                                GameViewModel(
                                    isWin: game.isWin,
                                    kill: game.stats.general.kill,
                                    death: game.stats.general.death,
                                    assist: game.stats.general.assist,
                                    killRate: game.stats.general.contributionForKillRate,
                                    gameType: game.gameType,
                                    createDate: game.createDate,
                                    championImageURL: game.champion.imageURL,
                                    itemsImageURL: game.items.map(\.imageURL),
                                    spellsImageURL: game.spells.map(\.imageURL),
                                    peakURL: game.peak,
                                    largestMultiKillString: game.stats.general.largestMultiKillString,
                                    opScoreBadge: game.stats.general.opScoreBadge,
                                    gameLength: game.gameLength
                                )
                            ),
                        ]
                    })
                    
                    self.lastMatch = value.games.last?.createDate.timeIntervalSince1970
                    
                    self.items.accept(items)
                }
            case .failure(let error):
                logger.error("\(error)")
            }
            
            self.isLoading = false
        }
    }
    
    func onAppear() {}
}

extension MainViewModel: SummonerProfileViewModelDelegate {
    
    public func onRefresh(in summonerProfileViewModel: SummonerProfileViewModel) {
        self.refresh()
    }
}
