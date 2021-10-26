# Original App Design Project - README Template

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

* User-login and Sign up
* scroll feature to view feed
* Category of exercises: Cardio, Bodybuilding, Calisthenics, Powerlifting
* View meal plans
* Saving progress on the individual's account

**Optional Nice-to-have Stories**

* Reader's Digest kind of guides 
* Point system
* Variable exercises
* Timer
* Collect badges upon completion and show off on their profile


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
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
