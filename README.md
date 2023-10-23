# Counter ProxyProvider
- Concepts used ProxyProvider, MultiProvider.
 
## ProxyProvider
- What if you want to pass such value which changes overtime and you want to passed updated value every time its change. If you are thinking you can do this with only Provider then you are wrong ….. `provider` package has something else to deal with this. It’s  ********Proxy********Provider  !!! 🎉🎊

```dart
int count;

Provider(
  create: (_) => MyModel(count),
  child: ...
)

**///** **************If *****count***** variable changing overtime,
/// then this Provider can't help in getting updated value**
```

- Instead you can do this

```dart
int count;

ProxyProvider0(
  update: (_, __) => MyModel(count),
  child: ...
)
```

- The another definition of ProxyProvider is
    
    > *****************“The provider that builds a value based on other providers.*****************
    > 
- ProxyProvider comes in a different variations:
    - ProxyProvider****0****, ProxyProvider, ProxyProvider******1******, ProxyProvider************2,************ ProxyProvider**************3**************,…..
- The digit after class name is the number of other providers that `ProxyProvider` depends on.
- Another interesting thing is that ProxyProvider different variants apart from ****************************ProxyProvider0**************************** is the syntax sugar in the top of ProxyProvider0
- `ProxyProvider2<A, B, Result>` is equal to:

```dart
ProxyProvider0<Result>(
  update: (context, result) {
    final a = Provider.of<A>(context);
    final b = Provider.of<B>(context);
    return update(context, a, b, result);
  }
);
```

- `ProxyProvider<T, R>`, what is T and R here? In simple word,
    - T is the Type that ProxyProvider is listening to
    - R is the Type that ProxyProvider passing down to child widget that are listening
