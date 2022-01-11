
import UIKit
import RxSwift
import RxDataSources

class SearchCityViewController: UIViewController, Storyboardabel {
    
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    private var viewModel: SearchCityViewPresentable!
    var viewModelBuilder: SearchCityViewPresentable.ViewModelBuilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = viewModelBuilder((
            searchText: searchTextField.rx.text.orEmpty.asDriver(), ()
        ))
        self.title = "Airports"
    }
}

