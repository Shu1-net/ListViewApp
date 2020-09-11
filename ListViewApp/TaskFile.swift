//
//  TaskFile.swift
//  ListViewApp
//
//  Created by 天野修一 on 2020/09/06.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

//構造体(変数を入れている）
struct Task: Identifiable {
    var id = String()
    var taskItem = String()
}

class TaskList: ObservableObject {
//    見える化して取ってくる
    @Published var tasks = [Task]()
//    値を別のclassの中に置き換えるために、Publishedを記述
}




class namesList: ObservableObject {
    
//    配列を定義
    @Published var names:[String] = ["ニワトリ","カラス","ハト","トンビ","キジ"]
    
    
    
}


