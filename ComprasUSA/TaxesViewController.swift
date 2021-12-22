
import UIKit

class TaxesViewController: UIViewController {
    
    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    func calculateTaxes(){
        lbStateTaxDescription.text = "Imposto do Estado (\(tc.getFormatedValue(of: tc.stateTax, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormatedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormatedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTax.text = tc.getFormatedValue(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormatedValue(of: tc.iofValue, withCurrency: "US$ ")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormatedValue(of: real, withCurrency: "R$ ")
    }
    
    @IBAction func changeIOF(_ sender: Any) {
        calculateTaxes()
    }
}
