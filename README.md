# FearlessStudios-FiveMTemplate

Hey there! Welcome to the FearlessStudios-FiveMTemplate. This is your go-to setup for crafting Lua resources tailored for FiveM.

## Utilizing Version Checker

This script provides a version-checking mechanism for your FiveM resource by comparing the current version with the latest version available on a specified GitHub repository.

#### Configuration

Before using the `versionCheck.lua` script, make sure to customize the following variables:

```lua
local authorName = 'CHANGEME' -- Your author name
local resourceName = 'CHANGEME' -- The name of your FiveM resource

local githubUsername = 'CHANGEME' -- Your GitHub username
local githubRepo = 'CHANGEME' -- Your GitHub repository name
local githubVersionFilename = 'CHANGEME' -- The filename on GitHub containing the version information
```

## Utilizing Helper Functions

#### GetClosestModelWithinDistance

This function retrieves information about the closest model within a specified distance from the player.

```lua
local maxDistance = 10.0
local items = {
    { model = "example_model1", textHeightOffset = 1.0 },
    { model = "example_model2", textHeightOffset = 0.5 },
    -- Add more model data as needed
}

local closestModelCoords, closestModelHandle, closestTextOffset = GetClosestModelWithinDistance(maxDistance, items)
```

- You can now use the retrieved information as needed
- closestModelCoords: Coordinates of the closest model
- closestModelHandle: Handle of the closest model
- closestTextOffset: Text height offset associated with the closest model (useful for drawing text on the model)

#### DrawError2D

This function displays an error message on the screen for a specified duration.

```lua
local errorMessage = "Error! Something went wrong."
local durationInSeconds = 5

DrawError2D(errorMessage, durationInSeconds)
```

#### DrawSuccess2D

This function displays a success message on the screen for a specified duration.

```lua
local successMessage = "Success! Action completed."
local durationInSeconds = 3

DrawSuccess2D(successMessage, durationInSeconds)
```

#### DrawText3D

This function draws text in 3D space at the specified coordinates.

```lua
local x, y, z = 123.45, 67.89, 10.0
local scale = 0.5
local text = "This is a 3D text example"

DrawText3D(x, y, z, scale, text)
```

#### DrawText2D

This function draws text on the screen at 2D coordinates.

```lua
local x, y = 0.5, 0.8
local text = "This is a 2D text example"
local scale = 0.6
local center = true -- Set to false for left-aligned text

DrawText2D(x, y, text, scale, center)
```


## Contributing

Your contributions are invaluable! If you encounter a bug or have a brilliant enhancement in mind, please don't hesitate to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE), providing you with the freedom to integrate it seamlessly into your own projects.

Happy coding!
