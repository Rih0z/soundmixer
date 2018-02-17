//
//  MusicSelectonTableViewController.swift
//  SoundMixer
//
//  Created by 利穂 虹希 on 2018/02/15.
//  Copyright © 2018年 EdTechTokushima. All rights reserved.
//

import UIKit
import MediaPlayer
class MusicSelectonTableViewController: UITableViewController {
    var Id:Int!
    var Playlist:MPMediaItemCollection!
    var SongNum:Int!
    var SongNames = [String]()
    var Songs = [MPMediaItem]()
    var SongName: String!
    var SongHash:Int!
    var Song:MPMediaItem!
    
    // Cell が選択された場合
    override func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Player", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)
        //self.navigationController?.popViewControllerAnimated(true) で前の画面に戻れる？https://qiita.com/moshisora/items/f1b6eeee5305e649d32b
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return SongNum
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell",for: indexPath)
        cell.textLabel?.text = self.SongNames[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //https://developer.apple.com/documentation/mediaplayer/mpmediaplaylist
        
       
        
    }

    override func viewWillAppear(_ animated: Bool) {
    
        super.viewDidDisappear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.Playlist = appDelegate.Playlists     
                    let songs = self.Playlist.items
                    self.SongNum = songs.count
                    print(self.SongNum)
                    for song in songs {
                        // self.Song = song
                        
                        let songTitle = song.value(forProperty: MPMediaItemPropertyTitle)
                        print("\t\t", songTitle!)
                        self.SongName = songTitle! as! String
                        self.SongNames.append(self.SongName)
                        self.Songs.append(song)
                        self.SongHash = song.hash
                    }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            appDelegate.playingSong = self.Songs[indexPath.row]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! PlayerViewController
            controller.title = self.SongNames[indexPath.row]
            controller.PlayingSong = self.Songs[indexPath.row]            
        }
    }
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
