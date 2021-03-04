//
//  Constants.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import Firebase

let COLLECTION_USER =  Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS =  Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING =  Firestore.firestore().collection("following")
let COLLECTION_TWEETS =  Firestore.firestore().collection("tweets")
let COLLECTION_MESSAGES =  Firestore.firestore().collection("messages")

