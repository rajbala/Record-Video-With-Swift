Record-Video-With-Swift
=======================

This is a trivial example of how to record video with Swift.  It creates an instance of `UIImagePickerController` and then presents it in `viewDidAppear()`

It then uses `UISaveVideoAtPathToSavedPhotosAlbum` in a delegate method to save the video to the user's camera roll.
