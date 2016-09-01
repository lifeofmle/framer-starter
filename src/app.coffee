device = new Framer.DeviceView();

device.setupContext();
device.deviceType = "google-nexus-6p";
device.contentScale = 1;

deviceHeight = device.screen.height
deviceWidth = device.screen.width

print "Device height: #{deviceHeight}"
print "Device height: #{deviceWidth}"

# Set background
bg = new BackgroundLayer
  backgroundColor: "#7DDD11"

# Create PageComponent
page = new PageComponent
  width: 900
  height: 600
  scrollVertical: false
  borderRadius: 3

page.center()

# Create layers in a for-loop
for i in [0...8]
  layer = new Layer
    superLayer: page.content
    width: 600
    height: 600
    backgroundColor: "#fff"
    borderRadius: 3
    opacity: 0.3
    x: 640 * i

# Staging
page.snapToNextPage()
page.currentPage.opacity = 1

# Update pages
page.on "change:currentPage", ->
  page.previousPage.animate
    properties:
      opacity: 0.3
    time: 0.4

  page.currentPage.animate
    properties:
      opacity: 1
    time: 0.4