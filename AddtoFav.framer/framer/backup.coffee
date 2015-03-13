# This imports all the layers for "AddTagAfterFav" into addtagafterfavLayers
motionanimationLayers = Framer.Importer.load "imported/AddTagAfterFav"

for layerGroup of motionanimationLayers
	window[layerGroup ] = motionanimationLayers[layerGroup ]
for layerGroup of motionanimationLayers
	motionanimationLayers[layerGroup ].originalFrame = window[layerGroup ].frame

Toast.scale = 0
Toast.opacity = 0

bkgd.on Events.Click,->
	Toast.scale = 0.5
	Toast.opacity = 0.3
	Toast.y = 900
	Toast.animate
		properties:{scale:1,opacity:1,y:850}
		curve:"spring(400,20,5)"
	Utils.delay 3,->
		Toast.animate
			properties:{scale:0,opacity:0,y:900}
			curve:"easy-out"
			time:0.2

# bkgd.on Events.Click,->
# 	Toast.scale = 0.7
# 	Toast.opacity = 1
# 	Toast.y = 1200
# 	Toast.animate
# 		properties:{y:800,scale:1}
# 		curve:"spring(300,25,5)"
# 	Utils.delay 3,->
# 		Toast.animate
# 			properties:{y:1200,opacity:0,scale:0.7}
# 			curve:"easy-out"
# 			time:0.2