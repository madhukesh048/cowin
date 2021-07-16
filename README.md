# fluwin

Fluwin - Covid resource app built in Flutter.

## UI/UX

Simple UI for easy navigation.

![fluwin](https://user-images.githubusercontent.com/31788197/125976220-27f1a669-5031-4bd1-b455-6388895f7724.png)


## API

Used Govt of India's public APIs for finding vaccines slots. The apis can be found [here](https://apisetu.gov.in/public/marketplace/api/cowin)

Home screen is divided into three main segments. First one has all vaccine realted resources, second with other covid resources and last one has all Govt helplines.

This takes pincode and date from the user to show list of Hospitals available. On click it shows the time and slots available.

Other options are webview of the respective websites. Helpline uses url_launcher to open phone app.

## Folder Structure

```
C:.
│   generated_plugin_registrant.dart
│   main.dart
│   tree.txt
│   
├───core
│   ├───models
│   │       session_model.dart
│   │       
│   └───services
│           api_service.dart
│           http_service.dart
│           
├───theme
│       theme.dart
│       
└───ui
        home.dart
        sessions.dart
        vaccine_finder.dart
        webview.dart
        
```

- core - consist of models and services. 
- theme - consist of theme file used in app.
- ui - consist of all views.




### Screenshots from the app

<a href="url"><img src="https://user-images.githubusercontent.com/31788197/125978348-2754c7ca-67a2-4fb2-b861-d290454a165c.jpg" height="420" width="240" ></a>


<a href="url"><img src="https://user-images.githubusercontent.com/31788197/125978639-d8794cd1-d55c-4238-92f8-8243d8f26398.jpg" height="420" width="240" ></a>


<a href="url"><img src="https://user-images.githubusercontent.com/31788197/125978666-63c4f0ac-3672-488a-945c-e6be749ec262.jpg" height="420" width="240" ></a>


<a href="url"><img src="https://user-images.githubusercontent.com/31788197/125978698-d83a85eb-1adb-49e1-8645-cc0b50b8f5fc.jpg" height="420" width="240" ></a>

## Links of resouces used in app
- [cowin](https://www.cowin.gov.in/)
- [covid 19 org](https://www.covid19india.org/)
- [cowin api](https://apisetu.gov.in/public/marketplace/api/cowin)
- [covid resources india](https://www.covidresourcesindia.com/)
- [covid india twitter help](https://covid19-twitter.in/)

