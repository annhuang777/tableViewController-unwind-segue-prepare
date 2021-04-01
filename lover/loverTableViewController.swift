//
//  loverTableViewController.swift
//  lover
//
//  Created by Pin yu Huang on 2021/3/19.
//

import UIKit

class loverTableViewController: UITableViewController {
   
    
    
    
    
    //有情人的array要顯示的(lover.swift這個file定義的Lover)
    var lovers = [Lover]()
    
    //左滑刪除使用type commmit這func
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        lovers.remove(at: indexPath.row)
        //choice1：普通用法
        tableView.reloadData()
        //choice2:增加動畫func tableView.deletaRow(ar:[indexPath,with:.automatic]
        
    }
    
    
    
    
        @IBAction func unwindToLoverTable(_ unwindSegue: UIStoryboardSegue) {
            
            
            if let sourceViewController = unwindSegue.source as? editTableViewController,
               let lover = sourceViewController.lover {
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    //修改
                    lovers[indexPath.row] = lover
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                    
                } else {
                    //新增
                    lovers.insert(lover, at: 0)
                    let indexPath = IndexPath(row: 0, section: 0)
                    //動畫效果
                    tableView.insertRows(at: [indexPath], with: .automatic)
                }
                
                Lover.saveToFile(lovers: lovers)
                
               
            }
        }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lovers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loverCell", for: indexPath)

        //定義indexPath位置編號及cell裡內容
        let lover = lovers[indexPath.row]
        cell.textLabel?.text = lover.name
        

        return cell
    }
    

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
    //要修改已填寫好的資料，將原本資料回傳到下一頁
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let controller = segue.destination as? editTableViewController,
           let row = tableView.indexPathForSelectedRow?.row{
            
            controller.lover = lovers[row]
        }
    }
    

}

