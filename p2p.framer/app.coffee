# This imports all the layers for "Ani2" into ani2Layers
PSD = Framer.Importer.load "imported/Ani2"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame

Amount = new Layer
	x:186
	y:646
	height:117
	width:278
	backgroundColor:"transparent"	

BuyAmount = 0
Amount.html = "#{BuyAmount}"
Amount.style ={
    'fontSize': '100px'
    'textAlign': 'center'
    'lineHeight': '100px'
    'color':'#000'
    'font-family':'HelveticaNeue-UltraLight'
    }

Interest = new Layer
	x:270
	y:783
	height:40
	width:123
	backgroundColor:"transparent"
InterestAmount = 0
Interest.html = "#{BuyAmount}"
Interest.style ={
    'fontSize': '40px'
    'textAlign': 'center'
    'lineHeight': '40px'
    'color':'#000'
    'font-family':'HelveticaNeue-Thin'
    }

Line.opacity = 0

duration= 0.8
totalAmount = 20000
stepsInterval = 20
steps = 0
increaseOfStep = totalAmount/(duration*1000/stepsInterval)

Handle.on Events.click,->
	print xxx

Handle.on Events.Click,->
	Utils.delay 0.2,->
		Handle.animate
			properties:
				rotationZ:120
			time:duration
			curve:"ease"
		Utils.interval stepsInterval/1000,->
			if steps < duration*1000/stepsInterval
				BuyAmount+= increaseOfStep	
				Amount.html = BuyAmount
				InterestAmount = Math.round(BuyAmount*0.12/365*90,4)
				Interest.html = InterestAmount
				steps++
						

	
	