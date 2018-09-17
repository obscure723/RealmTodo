import Foundation
import RealmSwift

class Todo: Object {
    
    @objc dynamic var id: Int = Int()
    @objc dynamic var title: String = String()
    @objc dynamic var date: String = String()
    
    var list = [NSDictionary]()
    
    func create(title: String) -> Void {
        let realm = try! Realm()
        
        try! realm.write {
            let todo = Todo()
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            todo.id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
            todo.title = title
            todo.date = formatter.string(from: now as Date)
            
            realm.add(todo)
        }
    }
    
    func getAll() -> Void {
        let realm = try! Realm()
        
        let list = realm.objects(Todo.self)
        
        for value in list {
            let todo = ["id": value.id, "title": value.title, "date": value.date] as NSDictionary
            self.list.append(todo)
        }
    }
}
