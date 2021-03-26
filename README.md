# EasyRequest

EasyRequest is a Swift library for dealing with Http Requests.

## Installation

Use the [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) to install EasyRequest.

```bash
https://github.com/bryanbarreto/easy-request
```

## Usage

```swift
import EasyRequest

/* create url with EasyRequest helper function: withPercentEncoding */
guard let url = URL.withPercentEncoding(string: "https://jsonplaceholder.typicode.com/todos") else {
    return
}

/* create a short Resource object */
let shortResource = Resource<SomeModel>(url: url)

/* or a complete Resource */
let completeResource = Resource<SomeModel>(
    url: url, 
    httpMethod: .get, 
    httpBody: Data(), 
    headers: ["Content-Type":"application/json"], 
    debugPrint: true
)

/* Now, just make a request */
WebService.shared.request(resource: resource, success: { (result) in
    //success
    print(result)
}) { (error) in
    //error
    print(error.rawValue)
    print(error.localizedDescription)
}
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
