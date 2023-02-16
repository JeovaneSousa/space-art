# Space Art

## An app to make you wonder about the infinite space

https://user-images.githubusercontent.com/66012358/219421615-33579e69-cef1-4ccf-b795-8a1ed6658402.mp4

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

https://user-images.githubusercontent.com/66012358/219421730-9c6879f7-6977-4a13-b3e0-4a32ac4491e8.mp4

https://user-images.githubusercontent.com/66012358/219421805-dd898801-658f-4e1c-a713-f0e5cc0183b7.mp4

https://user-images.githubusercontent.com/66012358/219421859-3c5fe509-e699-4146-8469-c7df47e6e1b0.mp4




