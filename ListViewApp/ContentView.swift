//
//  ContentView.swift
//  ListViewApp
//
//  Created by 天野修一 on 2020/09/06.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import SwiftUI
import Combine
//お互いを読み込み合う必要アリ

struct ContentView: View {
//              namesList、taskListは別ファイルで作成したclass名
//              変数nList、tListはそれぞれに設定したclassを呼び起こすためのインスタンス的なもの
    @ObservedObject var nList = namesList()
//  ↑親Viewで所有しているObservableObjectを直系の子Viewでも読み書きできるようにしたい場合に使用する
    @ObservedObject var tList = TaskList()
//    変数newTaskは空データに設定
    @State var newTask : String = ""
//    テキストフィールドとボタンを作成(表示はされない)
    var addTaskBar : some View{
        HStack{
            TextField("追加してください",text:self.$newTask)
            Button(action: self.addNewTask, label: {Text("add")})
//            ボタンのアクションとしての処理、ラベルは見た目
        }
    }
    
//    ボタンを作成
    func addNewTask() {
//        idとして入力された数＋1ぶんTaskに入る
        tList.tasks.append(Task(id: String(tList.tasks.count + 1), taskItem: newTask))
        self.newTask = ""
    }
        
        
    var body: some View {
        NavigationView {
            VStack {
//              作成したaddtaskBarを表示
                addTaskBar.padding()
                List {
                    ForEach(self.tList.tasks){Index in
                        Text(Index.taskItem)
//                        　　　　別ファイルで作った構造体にある変数のデータの方！
                    }
                    /// 行削除操作時に呼び出す処理の指定
                    .onDelete(perform: rowRemove)
                }.navigationBarTitle("Taskリスト")
                .navigationBarItems(trailing: EditButton())
//                editボタンの追加
            }
        }
    }
    
    // 行削除処理
    func rowRemove(offsets: IndexSet) {
        self.tList.tasks.remove(atOffsets: offsets)
    }
//    なぜ配列名ではなく、self.tList.tasksなのだろうか




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
