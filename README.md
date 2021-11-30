Nutrition & Fitness - README Template
===

# Nutrition & Fitness

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that can provide a curated workout based on muscle group emphasis and help with nutrition. Like muscle-wiki the user could choose a part of the body to emphasis and then the page will show which type of exercises to do to gain more strength in this area as well as food recipes to aid with muscle growth.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Health & Fitness
- **Mobile:** Users can use the app on the go. Highly mobile as user can do the exercises at home or in other areas.
- **Story:** Allows the user to view meal plans, and workout routines on the go.
- **Market:** Beginners/Novices
- **Habit:** Saving progress on one's account could motivate users to continue exercising
- **Scope:** First phase consists of putting in the exercise routines, and meal plans as viewable content for user. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User-login and Sign up
- [] scroll feature to view feed
- [] Category of exercises: Cardio, Bodybuilding, Calisthenics, Powerlifting
- [] View meal plans
- [] Saving progress on the individual's account

**Optional Nice-to-have Stories**

- [] Reader's Digest kind of guides 
- [] Point system
- [] Variable exercises
- [] Timer
- [] Collect badges upon completion and show off on their profile


### 2. Screen Archetypes

* Login
   * User login, log off and sign up
* Detail
   * Include detail about the recipes
   * Include detail about the exercises themselves
* Profile
   * User can save their progress and select their fitness goal
   
* Stream
   * Log off
   * recommended exercises/meal plans
* Setting
   * Dark mode and light mode toggle
   * Language(?)


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Exercise
* Meals
* Profile
* Stream
* Settings

**Flow Navigation** (Screen to Screen)

* Login
   * => Stream(Home)
* Exercise
   * => Stream(Home)
   * => Fitness Goal Categories
* Meals
   * => Meal catergories (based on fitness goal)
* Profile
   * => Profile picture change
   * => Password change
* Stream
   * => table cells that leads to articles/ other tabs
   

## Wireframes
[Add picture of your hand sketched wireframes in this section]
* Michael
<img src="https://i.imgur.com/qeopHBN.jpg" width=600>

### Other wireframes:
* Betsy
<img src="https://imgur.com/pquWQyH.jpg" width=500>
<img src="https://imgur.com/EpGKSM2.jpg" width=500>
<img src="https://imgur.com/wrc4O5O.jpg" width=500>
* Lamine
<img src="https://imgur.com/6N7IF3N.jpg" width=500>
* David
<img src="https://imgur.com/PsKiUQx.jpg" width=500>
 

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models

#### User
| Property | Type | Description |
| --------------- | --------------- | --------------- |
| userId | String | Unique ID /Username |
| photoId | File | Profile photo the user can upload |
| savedMeal |File | Contains user's saved meals|
| savedExercises |File | Contains user's saved exercises|
| programId |File | The selected program will be viewable here|

#### Meal
| Property | Type | Description |
| --------------- | --------------- | --------------- |
| mealId | String | Meal name |
| photoId | File | Photo of the meal in the feed|
| calorieAmt | String | Calorie information for the meal| 
| timeDuration | String | Time it takes to cook the meal|
| savedMeal |Pointer to User | The "liked" meals will be saved onto the user |

#### Exercises
| Property | Type | Description |
| --------------- | --------------- | --------------- |
| exerciseId | String | Exercise name |
| photoId | File | Photo of exercise  |
| caption | String | Description of exercise; muscle emphasis|
| timeDuration | String | Estimated time exercise will take|
| savedExercises |Pointer to User | The "liked" exercises will be saved onto the user |
| programId |String | holds programs |


#### Programs
| Property | Type | Description |
| --------------- | --------------- | --------------- |
| programId| String | program name |
| programIdPtr| Points to User | stores program name and points to user |

#### Settings
| Property | Type | Description |
| --------------- | --------------- | --------------- |
| userId | String | Unique ID /Username |
| viewId | String | Light or dark mode toggle |
| language | File | sets of languages user can select |


### Networking

#### Login Screen
* (Create/POST) Create a new username
* (Create/POST) Password
* (Read) Read and check login credentials

#### Home Screen 
* (Update/PUT) Update progress of the user
* (Read/GET) Suggested workouts
* (Read/GET) Suggested meals
* (Update/PUT) User logout 

#### User Screen
* (Update/PUT) The user's fitness goals 
* (Update/PUT) Change the user's profile photo
* (Delete) Remove current user profile photo
* (Read/GET) Show user information

#### Meal Screen
* (Read/GET) Meal feed; list of recipes
* (Read/GET) Query
* (Update/PUT) Save button for user to save meal

#### Exercises Screen
* (Read/GET) Exercise feed; list of exercises
* (Read/GET) Query
* (Update/PUT) Save button for user to save exercise

#### Save Screen 
* (Read/GET) Show user's liked meals
* (Read/GET) Show user's liked exercises
* (Delete) Remove saved meal
* (Delete) Remove saved exercise


#### Settings Screen 
* (Update/PUT) Change user's light/dark theme

### Basic snippets for each Parse network request
* Get Posts
    ```
    // iOS
    // (Read/GET) Query all posts where user is author
    let query = PFQuery(className:"Post")
    query.whereKey("author", equalTo: currentUser)
    query.order(byDescending: "createdAt")
    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
       if let error = error {
          print(error.localizedDescription)
       } else if let posts = posts {
          print("Successfully retrieved \(posts.count) posts.")
          // TODO: Do something with posts...
       }
    }
    ```
* Sign up for user account   
    ```
     user.username = usernameField.text //set to the user field from loginPage
        user.password = passwordField.text//repeat for password
        user.signUpInBackground { (success, error) in
            if success{ //if no eror
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)") //print error variable
            }
        }
* Login creditials checkpoint
```
 let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
```        
* Upload user profile photo from photo library
```
  let post = PFObject(className: "Posts") //like a dictionary put arbitrary keys and numbers
        post["caption"] = commentField.text
        post["author"] = PFUser.current()! //current person
        
        //grab imagedata binary
        let imageData = imageView.image!.pngData() //saved as png
        //let file = PFFileObject(data: imageData!) //binary object
        let file = PFFileObject(name: "image.png", data: imageData!)
        post["image"] = file //column will have the file url containing the image
        
        post.saveInBackground { (success, erorr) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            }else{
                print("error!")
            }
        }
```

* Delete an item
```
[PFObject deleteAllInBackground:objectArray block:^(BOOL succeeded, NSError * _Nullable error) {
    if (succeeded) {
        // The array of objects was successfully deleted.
    } else {
        // There was an error. Check the errors localizedDescription.
    }
}];

```
# Group Milestone #1
Gif:
https://imgur.com/a/VJsQOZB
=======
<img src='https://i.imgur.com/wTbqkIR.gif' title='GIF Walkthrough' width='600' alt='Video Walkthrough' />
>>>>>>> 40fdf4e07feb234fc8152f63fae706168bb2d666

# Group Milestone #2
Gif:
https://imgur.com/a/c1FZppf
=======
<img src='https://i.imgur.com/CthX1hZ.gif' title='Login Storyboard' width='600' alt='Video Walkthrough' />
<img src='https://i.imgur.com/WuIsNyX.gif' title='Login View controller code for login, sign up screen button, and sign up button.' width='600' alt='Video Walkthrough' />
<img src='https://i.imgur.com/Q6jJxM5.gif' title='App delegate Parse code' width='600' alt='Video Walkthrough' />
<img src='https://i.imgur.com/XnqmVpI.gif' title='Scene Delegate Parse code (if user is already logged in).' width='600' alt='Video Walkthrough' />

#Group Milestone #3
Gif:
https://imgur.com/a/X6hcP6n
=======
<img src='https://i.imgur.com/q9VfzRJ.gif' title='Milestone 3 - Gif' width='600' alt='Video Walkthrough' />

#Group Milestone #4
Gif:
https://imgur.com/a/kzUmQ1y
=======
<img src='https://i.imgur.com/kh4T7on.gif' title='Milestone 3 - Gif' width='600' alt='Video Walkthrough' />

