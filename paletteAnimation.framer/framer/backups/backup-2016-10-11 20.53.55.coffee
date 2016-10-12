# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: "Palette"
	author: "Victor Arellano"
	twitter: ""
	description: "A color palette mobile application mockup"


# Import file "palette"
sketch = Framer.Importer.load("imported/palette@1x")

Utils.globalLayers(sketch)
Canvas.backgroundColor = "#15B6A7"

# mainPage = new Layer
# 	size: Screen.size


	
#VARIABLES
bounce = 'spring(100,10,0)'
hover = 'spring(200, 20, 0)'
transition ='spring(200, 20, 0)'

#LOADSCREEN
# LoadScreen.visible = false
circles.props =
	opacity: 0
	
logo1.props =
	y: - Screen.height
	originY: 0.5
	originX: 0.5
	
LoadScreen.props =
	z: 10
	
	
loadAnim =
	logo1.animate
		properties:
			y: 400
			x: Screen.center
		curve: bounce
		time: 2
		logo1.onAnimationEnd ->
			circles.animate
				properties:
					opacity: 1
				circles.onAnimationEnd ->
					LoadScreen.animate
						properties:
							opacity: 0
						delay: 3
					sign_in1.animate
						properties:
							opacity: 1

			
loadAnim.start()

			
#SIGNUP
	
sign_in1.props = 
	shadowY: 6
	shadowBlur: 20
	opacity: 0
	
	
sign_in1.on Events.MouseOver,->
	sign_in1.animate
		properties:
			shadowY: 20
			shadowBlur: 80
			scale: 1.15
		curve: hover
		
sign_in1.on Events.MouseOut,->
	sign_in1.animate
		properties:
			shadowY: 6
			shadowBlur: 20
			scale: 1
		curve: hover

sign_in1.on Events.Click, ->
	sign_in1.animate
		properties:
			x: 0
			y: 0
			width: Screen.width
			height: Screen.height
# 	Onboarding.animate
# 		properties:
# 			y: 0
			scale: 1
			opacity: 1
			height: Screen.height
		curve: transition

			
	
		
	
	

#ONBOARDING

Onboarding = new Layer
	width: Screen.width
	height: Screen.height
	y: -Screen.height
	backgroundColor: '#fff'
	z: 8
	
backSlide = new Layer
	backgroundColor: '15B6A7'
	size: Screen.size
	superLayer: Onboarding

slides = []

for i in [1..4]
	page = new Layer
		name: "page#{i}"
		parent: Onboarding
		height: Screen.height
		width: Screen.width
		backgroundColor: '#fff'
	slides.push page
		
	images = new Layer
		name: "image#{i}"
		parent: page
		height: Screen.height/2
		width: Screen.width
		y: Align.top
		image: Utils.randomImage()
		
	content = new Layer
		name: "content#{i}"
		parent: page
		height: 450
		width: 550
		backgroundColor: '#fff'
		y: Align.bottom(-150)
		x: Align.center
		shadowY: 2
		shadowBlur: 10
		shadowSpread: 1
		shadowColor: "rgba(0,0,0,1)"
		
		
	
#EVENTS

#runs a loop through slider array
for moveSlides in slides
	#when you click on any of the slides the event goes off
	moveSlides.on Events.Click, ->
		#the slide that is clicked will animate
		@.animate
			properties:
				x: - Screen.width
				opacity: 0
			

#last slide will animate off scree or whatever transition you want. 
backSlide.on Events.Click, ->
	backSlide.animate
		properties: 
			x: 0
			height: 0
	Palette.animate
		properties:
			y: 0
			x: 0
	
		

#PALETTE



	
	
			

			
	
		
			
			

		
		
		
		

	

			
			
			




			

		
	

	