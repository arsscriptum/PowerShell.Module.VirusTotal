# $${\color{red}OpenAI \space \color{lightblue}PowerShell \space \color{orange}Module}$$


$${\color{yellow}Important: \space this \space module \space is \space a \space Sandbox/Development \space project \space only. \space Not \space Production \space code.}$$



PowerShell Module to call [OpenAI Developer API functions](https://api.OpenAI.com/)

The OpenAI API can be applied to virtually any task that involves understanding or generating natural language or code. You need to use different [models](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Get-OpenAIModels.md) for different tasks, and you can fine-tune your own custom models. These models can be used for everything from **content generation to semantic search and classification.**

## Speech Synthesis

Whats better than Speech Synthesis of AI generated replies, tat is having the computer say the anwsers to you ?
Last Version 1.0.423.1 supports Speech Synthesis. Use the ```-SpeechSynth``` argument

## Initialisation and Setup

[Create OpenAI App](https://beta.openai.com/docs/introduction/overview)
The app provides, among others, the Client ID and Client Secret needed to implement any of the authorization flows.



## Functions - Init and Authentication
 - [Get-OpenAIAuthenticationHeader](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Get-OpenAIAuthenticationHeader.md)
  - [Uninitialize-OpenAIModule](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Uninitialize-OpenAIModule.md)
  - [Initialize-OpenAIModule](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Initialize-OpenAIModule.md)


## Functions - Request Text Completion
 - [Invoke-OpenAiTextCompletion](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Invoke-OpenAiTextCompletion.md)


## Functions - Request Code Completion
 - [Invoke-OpenAiCodeCompletion](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Invoke-OpenAiCodeCompletion.md)


## Functions - Open AI Models data requests
 - [Update-OpenAIModels](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Update-OpenAIModels.md)
  - [Get-OpenAIModelsLocalFilePath](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Get-OpenAIModelsLocalFilePath.md)
  - [Get-OpenAIModels](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Get-OpenAIModels.md)
  - [Get-OpenAIModelsByCategory](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Get-OpenAIModelsByCategory.md)
  - [Export-ModelsIdsToJson](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Export-ModelsIdsToJson.md)
  - [Export-ModelsIdsToMd](https://github.com/arsscriptum/PowerShell.Module.OpenAI/blob/master/doc/Export-ModelsIdsToMd.md)


## Last Update

Tuesday, January 24, 2023 11:34 PM


![Demo](https://raw.githubusercontent.com/arsscriptum/PowerShell.Module.OpenAI/master/gifs/demo.gif)



