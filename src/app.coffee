{ InputField } = require 'InputField'

# setup device for presentation
device = new Framer.DeviceView();

device.setupContext()
device.deviceType = "google-nexus-6p"
device.contentScale = 1

deviceHeight = device.screen.height
deviceWidth = device.screen.width

app = Framer.Importer.load("framer/imported/app@1x")

initialScale = 0.2

actionButtons = []

# the input element from module
taskInput = new InputField
  name: "task"
  type: "text-area"
  width:  deviceWidth
  height: deviceHeight - app.keyboard.height
  color: "DarkCyan"
  backgroundColor: "#f5f5f5"
  fontSize: 200
  indent: 120
  placeHolder: "Add task"
  placeHolderFocus: ""
  autoCapitalize: true

# hide some layers for the initial state
app.actions.opacity = 0
app.overlay.opacity = 0
app.iconWrite.opacity = 0
app.keyboard.opacity = 0
app.keyboard.y = app.keyboard.height + deviceHeight
taskInput.opacity = 0

# hide and set initial y position of the keyboard
app.iconWrite.rotation = -180

# Create an array of action layers (Add, Reminder, Task)
for i in [0..2]
 actionButtons.push app["action#{i+1}"]

# Add initial scale value to action buttons
for action in actionButtons
 action.scale = initialScale

 # define states
app.overlay.states.add
  openActions: { opacity: 1 }
app.overlay.states.animationOptions = curve: "spring(400, 20, 0)"

app.actions.states.add
  openActions: { opacity: 1 }
app.actions.states.animationOptions = curve: "spring(400, 20, 0)"

app.keyboard.states.add
  openInput: { opacity: 1; y: deviceHeight - app.keyboard.height}
app.keyboard.states.animationOptions = { curve: "linear", time: 0.1 }

for action in actionButtons
  action.states.add
    openActions: { scale: 1 }
  action.states.animationOptions = curve: "spring(500, 30, 0)"

app.iconPlus.states.add
  openActions: {
    opacity: 0,
    rotation: 90
  }
app.iconPlus.states.animationOptions = curve: "spring(500, 30, 0)"

app.iconWrite.states.add
  openActions: {
    opacity: 1,
    rotation: 0
  }
app.iconWrite.states.animationOptions = curve: "spring(500, 30, 0)"

taskInput.states.add
  openInput: { opacity: 1 }
taskInput.states.animationOptions = { curve: "spring(500, 30, 0)", time: 0.1 }

# functions
switchOptions = (state) ->
  app.overlay.states.switch(state)
  app.actions.states.switch(state)
  for action in actionButtons
    action.states.switch(state)
  app.iconPlus.states.switch(state)
  app.iconWrite.states.switch(state)

switchInput = (state) ->
  taskInput.states.switch(state)
  app.keyboard.states.switch(state)

# events
app.floatingButton.on Events.Click, ->
  switchOptions("openActions")

app.overlay.on Events.Click, ->
  switchOptions("default")

app.action2.on Events.Click, ->
  switchInput("openInput")

app.keyboard.on Events.Click, ->
  switchInput("default")
  switchOptions("default")
