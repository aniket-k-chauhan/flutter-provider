# Counter Provider
Concepts used Provider, Consumer, ChangeNotifier, ChangeNotifierProvider

## Provider
- You can consider Provider with fishing analogy.
- `final user = Provider.of<User>(context);`
- In above line of code,
    - User is a 🐠 that we are trying to grab
    - The fisherman 🎣 is provider for us which get that fish(User).
    - the context in river 🌊 , which contains other information of widget like Theme, etc. (We learn about that above!!)
- Now How can we create a way that the data can be passed?
    - The answer is Wrapping Provider around the top of the widget tree such that children below who need these data can access it.
    - ********************REMEMBER,******************** the widget above Provider can’t access data as context only flows down.
 
### Reading Value of Provider

- You can read provider value from either of following method and which suites your purpose behind using it:
    - `context.watch<T>()` or `Provider.of<T>(context)` : which makes widgets to listen to changes of T
    - `context.read<T>()` or `Provider.of<T>(context, listen: false)` : which returns t without listening to it, which means this method will not update widgets, as we set listen to false but we can use <T> other properties like method to update it and other widgets which are listening to it they will update.
    
> [!WARNING]
> `context.read<T>()` shouldn’t be call inside widget build method. You can place it in initState (if StatefulWidget), inside Event Handlers(e.g.,onPressed()), use Consumer widget, etc.
