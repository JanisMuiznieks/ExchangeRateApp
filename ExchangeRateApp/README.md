## iOS Test Assignment

### Task

The goal of this assignment is to allow you to demonstrate your programming skills and to illustrate your approach when developing a mobile application.

Your app should be production ready - in addition to assessing your code quality, I will be trying to break your app by testing for different usability issues that a real user might encounter. Your task is to implement an exchange rates app. The app must request and update currency rates every second using an API.

API endpoint: `https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios`.

<table>
    <tr>
        <th>Key</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
        <td>pairs</td>
        <td>Number</td>
        <td>Pair of currency codes to compare rates (e.g. EURUSD - 1 Euro compared to United States dollars).</td>
    </tr>
</table>

```json
{
    "EURUSD": 1.1381
}
```

Users should be able to:

- Add a new currency pair;
- Remove a currency pair.

The list of currency pairs should be preserved across application launches.

### Code requirements

- Please use the latest stable Xcode + Swift;
- Avoid use of third-party libraries such as [RxSwift](https://github.com/ReactiveX/RxSwift). I would prefer to see a vanilla approach so I can see you understand the underlying concepts. We do use third-party libraries at Accenture, of course, but for the purposes of this test, please avoid doing so;
- Please ensure your application has good test coverage;
- Structured and clear commit history.

### Application flow

<img alt="Preview GIF describing the application flow" width="50%" src="preview.gif" />

### Resources

You will find fonts, colors and everything else that may come in handy in Figma [project](https://www.figma.com/file/Vh2zTldjRFFqSk29AmZeVBWy/Exchange-%26-Rates).
UI does not have to be exactly the same, the final implementation is up to you. 

Also, in a zip archive you will find the following:

- A GIF describing the application flow;
- A list of currencies supported by the test assignments back end.

**NB!** Generic icons can be referenced from [SF Symbols 2.1](https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-2.1.dmg) macOS application.

### What I am looking for:

- Clarity, elegance, and maintainability of code;
- Code consistency. Please refer to a community maintained style guide if you’re unsure;
- A clear architecture and adherence to iOS design patterns;
- Knowledge of the iOS human interface guidelines;
- Appropriate application of relevant native iOS frameworks (Foundation, UIKit, SwiftUI);
- Good code coverage with Unit tests.

### What I don’t want to see:

- Overengineered code;
- Copy-pasted chunks that you don't entirely understand;
- Lack of Unit testing.

### When you think you're done

I expect to be able to run your code without fuss - so if there are any specifics that are needed to get your code running, please commit them to git repository if possible.
