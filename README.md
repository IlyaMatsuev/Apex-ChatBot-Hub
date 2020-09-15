# Apex-Bot-Helper-Library

This is an Apex library for easiest developing your own bots based on such messengers and social networks as _Telegram, VK, ..._.
Enjoy!

## Features
// TBD

  - Delegating trigger handlers for different Apex jobs in scope of a DML transaction - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#usage)
  - Exchanging parameters between all handlers (from one to other and in reverse) - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#properties)
  - Opportunity to skip particular handlers (or all of them) - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#skipallhandlers)
  - Setting trigger error handler instance for a particular handler or for all of them - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#TriggerDispatcher)
  - Setting trigger service instance for a particular handler or for all of them (**Still in development**) - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#TriggerDispatcher)
  - Binding asynchronous trigger handlers - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#bindAsync)
  - Scheduling handlers to run in a particular time (for instance, in 3 minutes) - [Show](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#bindAsync)

## Installation

Clone the repository

```bash
git clone https://github.com/IlyaMatsuev/Apex-Bot-Helper-Library.git
cd apex-bot-helper-library
```

// TBD

Run the script and follow the instructions to prepare your scratch

```bash
./scripts/sh/upload-scratch.sh <SCRATCH_ALIAS> <DEV_HUB_ALIAS>
```

Or deploy it to production

```bash
./scripts/sh/upload-prod.sh <ORG_ALIAS>
```

## Usage
// TBD

Trigger definition used the library would look something like this
```java
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    TriggerDispatcher.dispatcher
            .bind(TriggerOperation.BEFORE_INSERT, new AccountTriggerValidationHandler())
            .bind(TriggerOperation.AFTER_UPDATE, new AccountTriggerUpdateHandler())
            .bindAsync(TriggerOperation.AFTER_INSERT, AsyncHandlerType.FUTURE, new AsyncAccountTriggerHandler())
            .bindAsync(TriggerOperation.AFTER_UPDATE, AsyncHandlerType.FUTURE, new AsyncAccountTriggerHandler())
            .setDefaultErrorHandler(new AccountTriggerErrorHandler())
            .run();
}
```
In the example above there are two sync [`bind()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#bind) and 2 async [`bindAsync()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#bindAsync) handlers for the Account trigger. Also there is a setting of a default error handler [`setDefaultErrorHandler()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#setdefaulterrorhandler) that will handle exceptions appearing in the handlers by default. To run all binded handlers we use the [`run()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#run) method.

Trigger handlers are required to implement the [`ITriggerHandler`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggerhandler) interface which includes only one method [`handle(TriggerContext context, ITriggerService service)`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#handle). The first argument is a trigger context that is the same instance for all trigger handlers. The second is a trigger service instance that you could set up for your handler(s) and use it as an utility variable.

Trigger error handlers are required to implement the [`ITriggerErrorHandler`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggererrorhandler). This is the method that will handle thrown errors. First argument is trigger context. The second one is an instance of Exception.

## Types

// TBD

##### `TriggerDispatcher`
Class representing an object for binding the trigger handlers.

###### **`dispatcher`**
A single instance of a dispatcher. Your are able to instantiate the dispatcher only by using this property. 

###### **`defaultService`**
An instance of an `ITriggerService` interface that is default for all handlers.

###### **`defaultErrorHandler`**
An instance of an `ITriggerErrorHandler` interface that is default for all handlers.

###### **`bind()`**
Define a trigger handler by mapping to a certain trigger event.  
Parameters:  
`event` - instance of a [`TriggerOperation`](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_enum_System_TriggerOperation.htm) enum representing trigger event the handler will be mapped to;  
`handler` - instance of an [`ITriggerHandler`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggerhandler) interface that is a class containing handler business logic;  
`options` - map of [`TriggerBindOption`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#triggerbindoption) options for a handler binding.

###### **`bindAsync()`**
Define an async trigger handler by mapping to a certain trigger event.  
Parameters:  
`event` - instance of a [`TriggerOperation`](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_enum_System_TriggerOperation.htm) enum representing trigger event the handler will be mapped to;  
`asyncHandlerType` - instance of an [`AsyncHandlerType`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#asynchandlertype) enum representing async handler execution type (**Still in development**);  
`handler` - instance of an [`ITriggerHandler`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggerhandler) interface that is a class containing handler business logic;  
`options` - map of [`TriggerBindOption`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#triggerbindoption) options for a handler binding.

###### **`setDefaultService()`**
Setter of a default service for all handlers.  
Parameters:  
`service` - instance of an [`ITriggerService`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggerservice) interface containing service business logic.

###### **`setDefaultErrorHandler()`**
Setter of a default error handler for all handlers.  
Parameters:  
`errorHandler` - instance of an [`ITriggerErrorHandler`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggererrorhandler) interface containing exception handling logic.

###### **`run()`**
Method for running all registered sync and async handlers in the order as they were defined.
&nbsp;

##### `TriggerContext`
Class representing a trigger context that is shared among all handlers and containing information about current trigger execution.

###### **`triggerEvent`**
Instance of a [`TriggerOperation`](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_enum_System_TriggerOperation.htm) enum containing the value for the current trigger event.

###### **`predOrPost`**
Instance of a [`TriggerType`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#truggertype) enum saying if right now is executing before or after trigger.

###### **`isAsyncRun`**
Returns `true` if a handler execution is async. `false` if it's not.

###### **`asyncRunType`**
Instance of a [`AsyncHandlerType`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#asynchandlertype) enum showing what is the async type we set up before for the handler binding.

###### **`newList`**, **`oldList`**, **`newMap`**, **`oldMap`**
The same properties as you can retrieve from the [`Trigger`](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_class_System_Trigger.htm) variable, but these guys will contain the values even in async trigger handlers.

###### **`properties`**
Map of properties that you can exchange between the handlers. You can provide any additional information even to your async trigger handlers, but it's not possible to share changed/added values from the async handler to another async handler. You can edit this property in sync handlers and use the coming values in async ones.

###### **`skippingAllHandlers`**
Returns `true` if in last executed handler you noticed by the [`skipAllHandlers()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#skipallhandlers) method that you don't need to run other handlers. Returns `false` by default.

###### **`handlersToBeSkipped`**
Set of classes` names that will be skipped by the [`skipHandler()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#skiphandler) method.

###### **`skipAllHandlers`**
Don't trigger all handlers that is coming next after the current one.

###### **`doNotSkipAllHandlers`**
This method cancels the action by the [`skipAllHandlers()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#skipallhandlers) method

###### **`skipHandler`**
Don't run the specified handler in the current transaction.  
Parameters:  
`handlerTypeName` - handler assigned name or its class name by default.

###### **`doNotSkipHandler`**
This method cancels the action by the [`skipHandler()`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#skiphandler) method.  
Parameters:  
`handlerTypeName` - handler assigned name or its class name by default.
&nbsp;

##### `TriggerDispatcherException`
An exception class that is used to notify the client about aby error related to wrong usage of the library or input parameters.
&nbsp;

##### `ITriggerHandler`
The interface for declaration classes that will be used as handlers in triggers.
###### **`handle()`**
Start entry for a trigger handler.  
Parameters:  
`context` - instance of a [`TriggerContext`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#triggercontext) representing a context of the current trigger execution;  
`service` - instance of an [`ITriggerService`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggerservice) interface representing a service object for the handler.
&nbsp;

##### `ITriggerErrorHandler`
The interface for declaration classes that will be used as objects for handling any exceptions appearing during a trigger execution.
###### **`handle()`**
Start entry for a trigger handler.  
Parameters:  
`context` - instance of a [`TriggerContext`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#triggercontext) representing a context of the current trigger execution;  
`error` - exception that caused the executing of the error handler.
&nbsp;

##### `ITriggerService` (**In Development**)
The interface containing some main methods needed for processing trigger handlers.
&nbsp;

##### `TriggerType`
The enum for detecting if the trigger execution is pred or post.  
###### **`AFTER`** - represents a post trigger execution;  
###### **`BEFORE`** - represents a pred trigger execution.
&nbsp;

##### `AsyncHandlerType`
The enum for specifying the type of async trigger handler declaration.  
###### **`FUTURE`** - handler will be run in a separate transaction just like usual future method;  
###### **`SCHEDULABLE`** - handler will be scheduled for executing after some 
&nbsp;

##### `TriggerBindOption`
The enum for specifying the options for a trigger handler declaration.  
###### **`SERVICE`** - indicate an option for an [`ITriggerService`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggerservice) instance for a particular handler;  
###### **`ERROR_HANDLER`** - indicate an option for an [`ITriggerErrorHandler`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#itriggererrorhandler) instance for a particular handler;  
###### **`DELAY`** - indicate a delay in minutes for the _SCHEDULABLE_ [`AsyncHandlerType`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#asynchandlertype);  
###### **`JOB_PREFIX`** - indicate a prefix for a job that will be created if you run with the _SCHEDULABLE_ [`AsyncHandlerType`](https://github.com/IlyaMatsuev/Apex-Trigger-Helper-Library#asynchandlertype). Default value is the handler class name;  
###### **`HANDLER_NAME`** - indicate a particular handler name by which you would be able to remove it from the trigger handlers queue or return it back there. Default value for every handler is its class name.
&nbsp;


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
