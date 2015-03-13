# This imports all the layers for "OfflineBrowsing4Animation" into offlinebrowsing4animationLayers
PSD = Framer.Importer.load "imported/OfflineBrowsing4Animation"
for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]

for layerGroup of PSD
    PSD[layerGroup ].originalFrame = window[layerGroup ].frame

document.body.style.cursor = "auto"
progressLayer1 = new Layer
	height:8
	width:0
	backgroundColor:"green"
	x:0
	y:124
progressLayer2 = new Layer
	height:8
	width:0
	backgroundColor:"green"
	x:80
	y:124
progressAnimation = new Animation({
	layer:progressLayer2
	properties:{width:640}
	time:6
	delay:1
	})
beginningAnimation = new Animation({
	layer:progressLayer1
	properties:{width:80}
	time:0.4
	delay:0.6
	curve:"easy-out"
	})
	
proAniStart=->
	beginningAnimation.start()
	progressAnimation.start()
proAniEnd=->
	beginningAnimation.stop()
	progressAnimation.stop()

		
Refresh.scale = 0.5
Refresh.opacity = 0.3
Content.draggable.enabled = true
Content.draggable.speedX= 0
iOrgContengY = Content.y
bRefresh = false

bMouseIsDown = false
iLastY = 0
Content.on Events.TouchStart,(e)->
	bMouseIsDown = true
	iLastY = e.pageY
Content.on Events.TouchMove,(e)->
	if !bMouseIsDown
		return
	proAniEnd()
	progressLayer1.width = 0
	progressLayer2.width = 0

	delta = e.pageY - iLastY
	iLastY = e.pageY
	if (delta + Content.y) >(iOrgContengY + 300)
		Content.y = iOrgContengY + 300
	else if (delta + Content.y)<78
		Content.y = 78
	else
		Content.y += delta
	shift = Content.y - iOrgContengY
	if (shift < 180)
		Refresh.scale = 0.3 + shift/300
	else if !bRefresh
		Refresh.animate
			properties:{scale:1.2,opacity:1}
			time:0.1
			curve:"easy-in"
		bRefresh = true

		
Content.on Events.TouchEnd,(e)->
	bMouseIsDown = false
	if !bRefresh  # release without refresh
		Content.animate
			properties:{y:iOrgContengY + 40}
			curve:"easy-in"
			time:0.15
	else	#release with refresh
		Refresh.scale = 0.5
		Refresh.opacity = 0.3
		bRefresh = false
		Content.animate
			properties:{y:iOrgContengY}
			curve:"easy-in"
			time:0.15

		proAniStart()				
		

			
# Content.on Events.DragMove,->
# 	shift = Content.y - iOrgContengY
# 	if shift > 300
# 		shift = 300
# 		
# 	Content.draggable.speedY = 1-shift/300
# 	if shift > 120
# 		Refresh.animate
# 			properties:{scale:1.2,opacity:1}
# 			time:0.1
# 			curve:"easy-in"
# 		bRefresh = true
# 	else
# 		Refresh.scale = 0.3 + shift/300

	
# Content.on Events.DragEnd,->
# 	if !bRefresh
# 		Content.animate
# 			properties:{y:iOrgContengY + 40}
# 			curve:"easy-in"
# 			time:0.15
# 		return
# 		
# 	Content.animate
# 		properties:{y:iOrgContengY}
# 		curve:"easy-in"
# 		time:0.15
# 	Refresh.scale = 0.5
# 	Refresh.opacity = 0.3
# 	Utils.delay 0.2, ->
# 		progressLayer.animate
# 			properties:{width:100}
# 			time:0.4
# 		Utils.delay 0.2, ->
# 			progressLayer.animate
# 				properties:{width:640}
# 				time:6
# 				delay:0.6
# 		
# # 		proAnimation.start()
	
	