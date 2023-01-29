//
//  DataManager.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TryCarApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    //MARK: - Core Data Saving support
    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    //MARK: - func set post title
    func setPostTitle(titleText: String, id: Int) -> [Posts] {
        let post = Posts(context: persistentContainer.viewContext)
        post.postTitle = titleText
        post.postId = Int64(id)
        return [post]
    }
    //MARK: - func set favorites
    func setFavorites(titleText: String, id: Int) -> [Favorites] {
        let fav = Favorites(context: persistentContainer.viewContext)
        fav.title = titleText
        fav.id = Int64(id)
        return [fav]
    }
    //MARK: - func fetch posts entity
    func fetchPosts(predicate: NSPredicate? = nil) -> [Posts] {
        let request: NSFetchRequest<Posts> = Posts.fetchRequest()
        var fetchedPosts: [Posts] = []
        request.returnsObjectsAsFaults = false
        do {
            fetchedPosts = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching posts \(error)")
        }
        return fetchedPosts
    }
    //MARK: - func fetch posts entity
    func fetchFavoritess(predicate: NSPredicate? = nil) -> [Favorites] {
        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        var fetchedPosts: [Favorites] = []
        request.returnsObjectsAsFaults = false
        do {
            fetchedPosts = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching favorites \(error)")
        }
        return fetchedPosts
    }
    //MARK: - func delete posts data
    func deletePosts() {
        let request: NSFetchRequest<Posts> = Posts.fetchRequest()
        do {
            let results = try persistentContainer.viewContext.fetch(request)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                persistentContainer.viewContext.delete(objectData)
            }
        } catch let error {
            print("Error fetching singers \(error)")
        }
    }
}
