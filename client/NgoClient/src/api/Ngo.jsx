import {
    getDoc,
    getDocs,
    collection,
    addDoc,
    deleteDoc,
    updateDoc,
    doc,
    setDoc,
  } from "firebase/firestore";
  import axios from "axios";


  import { db, auth, storage } from "../config/firebase";


  export const fetchEvents = async() => { 
    try {
        const eventsRef = collection(db, "Events");
        const data = await getDocs(eventsRef);

        const filteredData = data.docs.map((doc) => ({
            event_id: doc.id,
            ...doc.data(),
          }));

          return filteredData;
    } catch (err) {
        console.log('error in fetching events', err);
    }
}

   export async function fetchPosts() {
    const response = await fetch('http://localhost:3000/posts');
    return response.json()
  }
  
//   export async function fetchPost(id) {
//     const response = await fetch(`http://localhost:3000/posts/${id}`);
//     return response.json()
//   }
  
//   export async function createPost(newPost) {
//     const response = await fetch(`http://localhost:3000/posts`, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json"
//       },
//       body: JSON.stringify(newPost)
//     });
//     return response.json()
//   }
  
//   export async function updatePost(updatedPost) {
//     const response = await fetch(`http://localhost:3000/posts/${updatedPost.id}`, {
//       method: "PUT",
//       headers: {
//         "Content-Type": "application/json"
//       },
//       body: JSON.stringify(updatedPost)
//     });
//     return response.json()
//   }
  
//   export async function deletePost(id) {
//     const response = await fetch(`http://localhost:3000/posts/${id}`, {
//       method: "DELETE",
//     });
//     return response.json()
//   }