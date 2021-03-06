# SwiftUI List inifinite scroll

## Demo

![Using app - demo](demo.gif)

## Just a test project

Using the onAppear Event to load more items in the List

```
var body: some View {
       NavigationView {
           VStack {
               List() {
                   ForEach(viewModel.items) { item in
                       Text(item.fullName)
                           .padding()
                           .onAppear {
                               self.viewModel.continuePagination(item: item)
                       }
                   }
               }
           }
           .navigationBarTitle(Text("Repository Infinite SwiftUI"), displayMode: .inline)
           .navigationBarItems(trailing:
                       VStack {
                           Text(viewModel.statusMessage)
           })
       }
   }
```
