# unitTest folder
If you want to test your library, you can use the unitTest folder which has the same structure like the example folder.
The only difference is, that it includes the [UnitTest dependency](https://github.com/KROIA/UnitTest) to test your library.

## Create a unitTest

At first you have to decide which structure form you want to use for your unit tests. I recommend to do all tests in one executable, because when you run the test executable, it will run all your tests. It will show you if any test failed.
* [All tests in one executable](#all-in-one-executable)
* [Each test as separate executable](#Splitted-test-executable)

### All in one executable
All your tests are implemented in one executable.
You can change the foldername "ExampleTest" to anything you want.
Now, to implement the test, go to the [UnitTest library tutoral](https://github.com/KROIA/UnitTest).

### Splitted test executable
All your tests are separated in multiple executables.
to create a new test executable, create a copy of the folder "ExampleTest" and rename it to fit your specific test name.
You can create as many project folders in the "unitTest" directory. Each project folder is compiled to a executable with the name of the folder.
The test projects are independent from each other.
Now, to implement such a test project, go to the [UnitTest library tutoral](https://github.com/KROIA/UnitTest).
