//
//  Constants.swift
//  Youtube Clone
//
//  Created by zero on 17/03/21.
//

import Foundation

struct Constants {
  static var API_KEY = "AIzaSyAVpl2CugmYOTgybzFFeh2zIPnJZbZJ6fo"
  static var PLAYLIST_ID = "UUjxKWBX9Lup7E7Qf9r4ht7w"
  static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
  static var VIDEOCEL_ID = "VideoCell"

}
