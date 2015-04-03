# This imports all the layers for "Untitled" into untitledLayers
PSD = Framer.Importer.load "imported/Untitled"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame
Content2.opacity = 0
LoginButton.on Events.Click,->
	LoginButton.opacity = 0
	Text.opacity = 0
	Content2.opacity = 1
	Monitored.opacity = 0
	Safely.opacity = 0
	Checkedbutton.scale = 0
	Monitored.opacity = 1
	Checkedbutton.animate
		properties:{scale:1.2}
		curve:"spring(500,20,0)"
		delay:0.2
	Safely.animate
		properties:{opacity:1}
		time:0.2
		delay:0.2

			
	Utils.delay 0.8,->
		Safely.animate
			properties:{opacity:0}
			time:0.1
		Checkedbutton.animate
			properties:{opacity:0}
			time:0.1
		

		Text.animate
			properties:{opacity:1}
			time:0.2
		