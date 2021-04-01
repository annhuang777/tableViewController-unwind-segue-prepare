//
//  editTableViewController.swift
//  lover
//
//  Created by Pin yu Huang on 2021/3/22.
//

import UIKit

class editTableViewController: UITableViewController {
    
    @IBOutlet weak var innerBeautySwitch: UISwitch!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var starTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
   
    var lover:Lover?

    override func viewDidLoad() {
        super.viewDidLoad()
        //從上一頁回來已存在的資料，可以最修改
        if let lover = lover {
         nameTextField.text = lover.name
        starTextField.text = lover.star
         weightTextField.text = lover.weight.description
         innerBeautySwitch.isOn = lover.innerBeauty
         }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //在unwind segue觸發前就會先觸發prepare 設定更新情人的資料
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //資料新增時，??為預設值
        let name = nameTextField.text ?? ""
        let star = starTextField.text ?? ""
        let weight = Double(weightTextField.text!) ?? 0
        let innerBeauty = innerBeautySwitch.isOn
          //name:name(lover.swift file的name)
    lover = Lover(name: name, star: star, weight: weight, innerBeauty: innerBeauty)
   }
    //填寫空白的alert
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //如果text"不為空白" 則returne 成立
        if nameTextField.text?.isEmpty == false,
           starTextField.text?.isEmpty == false,
           weightTextField.text?.isEmpty == false{
        return true
        
    }
    else{
        let alerController = UIAlertController(title: "發生錯誤", message: "請勿空白", preferredStyle:.alert)
        alerController.addAction(UIAlertAction(title: "完成", style: .default, handler: nil))
        present(alerController, animated: true, completion: nil)
        //發生錯誤回傳false不成立
        return false
      
    
    
    
    
    
    
}

    }
   }
    
        
    
    
