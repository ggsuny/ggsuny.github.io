# This imports all the layers for "Materials" into materialsLayers
PSD = Framer.Importer.load "imported/Materials"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame

RedDots.opacity = 0
GreyDots.opacity = 1
InputAgain.opacity = 0
WrongPassword.opacity = 0
SetSuccess.opacity = 0

DotsClipper = new Layer
	x:0
	y:0
	height: 400
	width: 80
	backgroundColor: 'transparent'

GreyDots.superLayer = DotsClipper

ClickNumber = 0

KeypadClick = new Layer
	y:700
	width: 640
	height: 436
	opacity: 0

DeleteButton = new Layer
	x:429
	y:1029
	height:107
	width:211
# 	backgroundColor: 'transparent'

InputCount = 0	


DeleteButton.on Events.Click,->
	ClickNumber--
	if ClickNumber < 0
		ClickNumber = 0
	DotsClipper.width = 80+ClickNumber*78 

NextScreen = new Layer
	width: 750
	height: 1380
	x:2000

KeypadClick.on Events.Click,->
	
	WrongPassword.opacity = 0
	GreyDots.opacity = 1
	ClickNumber++
	DotsClipper.width = 80+ClickNumber*78	
	if ClickNumber > 5
		DotsClipper.width = 80+ClickNumber*78
		ClickNumber = 0
		InputCount +=1
		
		Utils.delay 0.7,->
			switch InputCount
				when 1,3 # First input complete.
					psd.animate # Psd and dosts moves out of screen
						properties:
							x: -800
						curve:"easy"
						time:0.2
					
					DotsClipper.animate
						properties:
							x:-875
						curve:"easy"
						time:0.2
					Utils.delay 0.3,->
						DotsClipper.x = 0
						DotsClipper.width = 80
						InputAgain.x = 1752
						InputAgain.opacity = 1
						psd.x = 1575
						psd.animate
							properties:
								x:75
							time:0.2
							curve:"easy"
						InputAgain.animate
							properties:
								x:252
							time:0.2
							curve:"easy"
				when 2  ## Code does not match
					GreyDots.opacity = 0
					#RedDots.opacity = 1
					InputAgain.opacity = 0
					WrongPassword.opacity = 1
					orgpsd = psd.x
					orgGreyDotes = GreyDots.x
					psd.x -=100
					GreyDots.x-=100
					psd.animate
						properties:{x:orgpsd}
						curve:"spring(500,15,20)"
					GreyDots.animate
						properties:{x:orgGreyDotes}
						curve:"spring(500,15,20)"
					
# 					Utils.delay 1,->
# 						RedDots.opacity = 0
					
				when 4
					SetSuccess.opacity = 1
					InputAgain.opacity = 0
					Utils.delay 1,->
						NextScreen.animate
							
							properties:
								x:0
							time:0.2
							curve: "easy"

	