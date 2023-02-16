# Space Art

## An app to make you wonder about the infinite space

About the app:

* I used the APOD NASA API (https://github.com/nasa/apod-api) to acquire amazing photos to show you.
* You have the ability to add the ones you like the most to you favorites
* You also have the ability to save the pictures you like into you device camera roll.


The following topics were approached during development:
* I tried to follow best practices when it comes to architechtural patterns by applying MVVM.
* I also used the native URLSession approach to consume the API used in this project. The concept Generics and Result class were used to make the Network layer as expansible and general as possible.
* Did my best to manage the memory and avoid retain cycles and to only update the UI using the main thread.
* Delegate pattern was used to communicate between Scenes.
* Everything was done programatically, which makes it a lot easier to review and maintain.

The following tools were used during the project development:

* Swift / UIKit
* MVVM
* Delegate pattern
* URLSessions
* Coordinator Pattern
* UI was done programmatically through view coding
* Git
* Kingfisher Dependency

* The idea was to not focus so much on design, but to apply the concepts of UIKit and Swift learned so far.

<div style="height: 533.33px; width: 300.00px; position:relative;"><iframe allow="autoplay; gyroscope;" allowfullscreen height="100%" referrerpolicy="strict-origin" src="https://www.kapwing.com/e/63ee4a7d7e60da0064a9c5b7?autoplay=true" style="border:0; height:100%; left:0; overflow:hidden; position:absolute; top:0; width:100%" title="Embedded content made on Kapwing" width="100%"></iframe></div><p style="font-size: 12px; text-align: right;">Video edited on <a href="https://www.kapwing.com/video-editor">Kapwing</a></p>

/Users/jeovanebarbosa/Desktop/Simulator Screen Recording - iPhone 14 Pro - 2023-02-16 at 12.55.03.gif
