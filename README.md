# ingatkan

Front End for Ingatkan by Nakama

## Getting Started

### Requirement
- flutter version 2.10.5 (not the newest)

### How to run
Do these commands:

- flutter pub get 
- flutter pub run build_runner build --delete-conflicting-outputs

### Structure Guide
#### Controller
- [module_name]_remote_data_sources: layer to connect the apps with back end using API

#### Model
- [model_name]: is a model in an object form

#### View
- [view_model]: logic layer to handle the logical functions and connecting to controller
- [presentation]: view layer that supposed to be just for User Interface