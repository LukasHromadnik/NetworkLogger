# NetworkLogger

Extension of Combine's `DataTaskPublisher` that logs the request and response to the console.

## Usage

```swift
URLSession.shared.dataTaskPublisher(for: url)
    .log()
```

Then after the `Publisher` is subscribed the `log` method prints something like
```
⬆️ POST https://mysuper.api
Headers: [
    Authorization : Bearer XYZ
]
Body: {
    "key": "value"
}
```

and when the response comes

```
⬇️ POST https://mysuper.api (✅ 200 OK)
Headers: [
    Content-Type : application/json
]
Body: {
    "response": {
        "key": 1
    }
}
```

## Inspiration

This library was inspired by [Reqres](https://github.com/AckeeCZ/Reqres).

## License

[MIT License](LICENSE)
