# This imports all the layers for "Ani" into aniLayers
PSD = Framer.Importer.load "imported/Ani"


for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame

KeyBoard.y = 1136
DetailAndPurchaseClip = new Layer
	x:0
	y:152
	width:640
	height:171
	backgroundColor:"transparent"
	
DetailAndPurchase.y -= 152
DetailAndPurchase.x -= 100

DetailAndPurchase.superLayer =  DetailAndPurchaseClip
DetailAndPurchaseClip.clip  = true


bMouseDown = false
OneMonth.on Events.TouchStart,->
	OneMonth.animate
		properties:
			scale:0.96
		curve: "ease"
		time: 0.4
	bMouseDown = true
	
OneMonth.on Events.TouchEnd,->
	OneMonth.animate
		properties:
			scale:1
		curve: "ease"
		time: 0.2
	orgX = Rate.x
	Rate.animate
		properties:
			x:orgX + 220
			scale:1.5
		time:0.3
		curve:"ease"
		delay:0.2
	Utils.delay 0.2,->
		RateInChinese.opacity = 0
		RateInChinese.visible = true
		RateInChinese.animate
			properties: 
				opacity:1
			time:0.3
			curve:"ease"
			delay:0.1
		Detail.animate
			properties:
				opacity:0
			time:0.2
			curve:"ease"
		WholeRect.animate
			properties:
				height:528
			time:0.4
			curve:"ease"
		LeftArea.animate
			properties:
				opacity:0
			time:0.1
			curve:"ease"
		orgRest = RestOfList.y
		RestOfList.animate
			properties:
				y:orgRest + 357
			time:0.4
			curve:"ease"
		
		DetailAndPurchaseClip.animate
			properties:
				height:528
			time:0.4
			curve:"ease"

				
PurchaseAreaClip = new Layer
	width:640
	height:0
	y:570
	x:0
	backgroundColor:"transparent"
PurchaseArea.y -= PurchaseAreaClip.y
PurchaseArea.x -= 100
PurchaseArea.superLayer = PurchaseAreaClip
PurchaseAreaClip.clip = true
BuyButton.on Events.Click,->
	WholeRect.animate
		properties:
			height:800
		time:0.4
		curve:"ease"
	PurchaseAreaClip.animate
		properties:
			height:400
		time:0.4
		curve:"ease"
		#delay:0.4
			
	RestOfList.animate
		properties:
			y: 970
		time:0.4
		curve:"ease"
		
	YBuyButton = BuyButton.y
	
	DetailAndPurchaseClip.height = 800
	BuyButton.animate
		properties:
			y:YBuyButton+190
		time:0.2
		curve:"ease"
		
	kbdelay = 0.6
	kbTime = 0.3
	KeyBoard.animate
		properties:
			y:704
		time:kbTime
		curve:"easy"
		delay:kbdelay
	dapy = DetailAndPurchaseClip.y
	DetailAndPurchaseClip.animate
		properties:
			y:dapy - 250
		time:kbTime
		curve:"easy"
		delay:kbdelay
	
	pcay = PurchaseAreaClip.y
	PurchaseAreaClip.animate
		properties:
			y:pcay - 250
		time:kbTime
		curve:"easy"
		delay:kbdelay
	
	OneMonth.animate
		properties:
			y:- 112
		time:kbTime
		curve:"easy"
		delay:kbdelay