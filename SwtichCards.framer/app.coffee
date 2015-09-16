# This imports all the layers for "Materials" into materialsLayers
PSD = Framer.Importer.load "imported/Materials"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame

SwitchCardsHotArea = new Layer
	x:50
	y:517
	width: 540
	height: 75
	backgroundColor: "transparent"

ListBkgdClip = new Layer
	width: 640
	height: 580
	backgroundColor: "transparent"

ListBkgdClip.states.add
	NoShow:
		height:580
	Show:
		height:800

ContentOfPsd.states.add
	Show:
		x:0
	NoShow:
		x:-540

ChooseBankcardsList.states.add
	Show:
		x:0
	NoShow:
		x:540
KeyPad.states.add
	Show:
		y:704
	NoShow:
		y:1636

CMB.states.add
	Show:
		x:61
		y:414
	NoShow:
		x:601
		y:414
	Selected:
		x:25
		y:533
PsdContentClip = new Layer
	x:50
	width: 540
	height: 800
	backgroundColor: "transparent"
	
ContentOfPsd.superLayer = PsdContentClip
ChooseBankcardsList.superLayer = PsdContentClip
CMB.superLayer = PsdContentClip
ContentOfPsd.states.animationOptions = 
	time:0.2
	curve:"easy"

ChooseBankcardsList.states.animationOptions = 
	time:0.2
	curve:"easy"
CMB.states.animationOptions = 
	time:0.2
	curve:"easy"
ListBkgdClip.states.animationOptions = 
	time:0.2
	curve:"easy"
KeyPad.states.animationOptions = 
	time:0.2
	curve:"easy"
Tick.states.add
	Defaut:
		y:85
	Moved:
		y:164
		
ContentOfPsd.x = 0
ChooseBankcardsList.x =0

bkgdOfList.superLayer = ListBkgdClip
ChooseBankcardsList.states.switchInstant("NoShow")
CMB.states.switchInstant("NoShow")
BackClickArea = new Layer
	x:70
	y:250
	width: 30
	height: 40
	backgroundColor: "transparent"

SwitchCardsHotArea.on Events.Click,->
	ContentOfPsd.states.switch("NoShow")
	ChooseBankcardsList.states.switch("Show")
	CMB.states.switch("Show")
	ListBkgdClip.states.switch("Show")
	bkgdOfPsd.opacity = 0
	KeyPad.states.switch("NoShow")
	
BackClickArea.on Events.Click,->
	ContentOfPsd.states.switch("Show")
	ChooseBankcardsList.states.switch("NoShow")
	ListBkgdClip.states.switch("NoShow")
	CMB.states.switch("NoShow")
	bkgdOfPsd.opacity = 1
	Utils.delay 0.2,->
		KeyPad.states.switch("Show")

CMB.on Events.Click,->
	CITIC.opacity = 0
	Tick.states.switchInstant("Moved")
	print Tick.y
	Utils.delay 0.4,->		
		ContentOfPsd.states.switch("Show")
		ChooseBankcardsList.states.switch("NoShow")
		ListBkgdClip.states.switch("NoShow")
		CMB.states.switch("Selected")
		bkgdOfPsd.opacity = 1
		Utils.delay 0.2,->
			KeyPad.states.switch("Show")

