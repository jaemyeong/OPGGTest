import UIKit
import Collections
import RxSwift
import RxCocoa
import RxDataSources

public final class MainViewController: ViewController<MainView, MainViewModel> {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<AnimatableSectionModel<ConfigurableTableViewSectionHeaderFooterIdentifier, AnyConfigurableTableViewItemIdentifier>> { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier, for: indexPath)
            
            item.configure(cell)
            
            return cell
        }
        
        self.viewModel
            .items
            .map { $0.map(AnimatableSectionModel.init(model:items:)) }
            .bind(to: self.contentView.tableView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
        
        self.contentView.tableView.delegate = self
        self.contentView.tableView.prefetchDataSource = self
        
        self.viewModel.onAppear()
    }
}

extension MainViewController: UITableViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.bounds.height) > scrollView.contentSize.height {
            self.viewModel.loadMore()
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.viewModel.items.value.elements[section].key.headerIdentifier == nil
        ? 0.0
        : UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.viewModel.items.value.elements[section].key.footerIdentifier == nil
        ? 0.0
        : UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard !self.viewModel.items.value.elements.isEmpty else {
            return nil
        }
        
        guard let headerIdentifier = self.viewModel.items.value.elements[section].key.headerIdentifier else {
            return nil
        }
        
        guard let headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier.reuseIdentifier) else {
            return nil
        }
        
        headerIdentifier.configure(headerFooterView)
        
        return headerFooterView
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard !self.viewModel.items.value.elements.isEmpty else {
            return nil
        }
        
        guard let footerIdentifier = self.viewModel.items.value.elements[section].key.footerIdentifier else {
            return nil
        }
        
        guard let headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerIdentifier.reuseIdentifier) else {
            return nil
        }
        
        footerIdentifier.configure(headerFooterView)
        
        return headerFooterView
    }
}

extension MainViewController: UITableViewDataSourcePrefetching {
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {}
}
