# This imports all the layers for "微粒贷" into 微粒贷Layers
PSD = Framer.Importer.load "imported/微粒贷"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame



About = new Layer
	width: 120
	height: 50
	x:180
	y:1200
	backgroundColor: "transparent"

WhiteBkgd.states.add
	Show:
		opacity:1
	NoShow:
		opacity:0
WhiteBkgd.states.animationOptions =
	time:0.2
	curve:"easy"

Content.states.animationOptions =
	time:0.2
	curve:"easy"

Close.states.animationOptions =
	time:0.2
	curve:"easy"
	
Close.states.add
	Show:
		opacity:1
		rotationZ:90		
	NoShow:
		opacity:0
		rotation:0
	
Content.states.add
	Show:
		opacity:1
		y:105
	NoShow:
		#opacity:0
		y: 2000
		
WhiteBkgd.states.switchInstant("NoShow")
Content.states.switchInstant("NoShow")
Close.states.switchInstant("NoShow")

			
About.on Events.Click,->
	WhiteBkgd.states.switch("Show")
	Utils.delay 0.1,->
		Content.states.switch("Show")	
	Utils.delay 0.3,->
		Close.states.switch("Show")
		
Close.on Events.Click,->
	Close.states.switch("NoShow")
	Utils.delay 0.2,->
		WhiteBkgd.states.switch("NoShow")
		Content.states.switch("NoShow")

