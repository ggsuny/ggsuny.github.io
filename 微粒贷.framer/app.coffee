# This imports all the layers for "官网微粒贷介绍" into 官网微粒贷介绍Layers
PSD = Framer.Importer.load "imported/官网微粒贷介绍"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame
	
ArrowAni = new Animation
	layer:Arrow
	properties:{y:995,opacity:0.3}
	time:0.5
	curve:"easy-in"
ArrowAni.start()
ArrowAni.on "end",->
	Utils.delay 1,->
		Arrow.y = 795
		Arrow.opacity = 1
		ArrowAni.start()

Cursor.opacity =0
CursorAni = new Animation
	layer:Cursor 
	properties:{opacity:1}
	time:0.1
CursorAni.on "end",->
	Utils.delay 0.6,->
		Cursor.opacity = 0
		Utils.delay 0.7,->
			CursorAni.start()
#CursorAni.start()
Img2.scale = 0.5
Img2.opacity = 0
Amount.visible = false
Point.visible = false
PressedButton.visible = false
KeypadClipper = new Layer
	x:565
	y:442
	height:274
	width:263
	backgroundColor:"transparent"
Keypad.superLayer = KeypadClipper
Keypad.y = 275
Keypad.x = 0
#Keypad.clip = true 
Details.x = 465
Utils.delay 1,->
	Point.visible = true
	Point.animate
		properties:{x:700}
		time:0.5
		curve:"easy-in"

	Utils.delay 1,->
		PressedButton.visible = true
		Utils.delay 1,->
				PressedButton.visible = false
				Img2.animate
					properties:{scale:1,opacity:1}
					time:0.2
					curve:"easy-in"
				Utils.delay 1,-> # More point to amount and press
					Point.animate
						properties:{y:332}
					Utils.delay 1.5,-> #showKeyboard
						Keypad.animate
							properties:{y:61}
							time:0.2
							curve:"easy-out"
						CursorAni.start()
						Utils.delay 1.5,->  # Simulate inputting number.
							Amount.visible = true
							Cursor.animate
								properties:{x: 698}
								time:0.5
							AmountFgd.animate
								properties:{x:50}
								time:0.5
							Utils.delay 0.3,->
								Details.visible = true
								