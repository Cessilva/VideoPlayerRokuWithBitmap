?"HI"
white=&hFFFFFF00
Screen = CreateObject("roScreen",false,854,480)
Screen.Clear(white)
' dfDrawImage(screen, "myphoto.jpg",0,0)
bitmap=CreateObject("roBitmap","pkg:/images/logo3.png")
myRegion=CreateObject("roRegion", bitmap,0,0,195,2024/18)
'DrawScaledObject(x as Integer, y as Integer, scaleX as Float, scaleY as Float, src as Object) as Boolean
'Screen.DrawObject(50, 10, myRegion)
Screen.DrawScaledObject(50, 10,1.5,1.5, myRegion)
Screen.Finish()
m.port = CreateObject("roMessagePort")
Screen.SetPort(m.port)
dx=0
dy=0
pressedState = -1 ' If > 0, is the button currently in pressed state
    while true
	if pressedState = -1 then
	    msg=wait(0, m.port)   ' wait for a button press
	else
	    msg=wait(1, m.port)   ' wait for a button release or move in current pressedState direction 
	endif
        if type(msg)="roUniversalControlEvent" then
                keypressed = msg.GetInt()
                '5:derecha
                '3:abajo
                '4:izquierda
                '2:arriba
                if keypressed=5 then
                        if dx<9 then
                        dx=dx+1
                        ?"Aqui"
                        myRegion.Offset(200,0,0,0)
                         print "dx:";dx;myRegion.getx()
                        print "dy:";dy;myRegion.gety()
                        'Screen.drawobject(50,10,myRegion)
                        Screen.DrawScaledObject(50, 10,1.5,1.5, myRegion)
                        Screen.finish()   
                        else 
                        ?"Alla"
                        dy=dy+1
                        dx=0
                        myRegion.Offset(-myRegion.getx(),2024/18,0,0)
                        'Screen.drawobject(50, 10,myRegion)
                        Screen.DrawScaledObject(50, 10,1.5,1.5, myRegion)
                        Screen.finish() 
                        end if
                        ?"RIGHT"
			            pressedState = 5 
                else if keypressed=4 then 
                        if dx=0 then
                        ?"Alla izquierda"
                        dy=dy-1
                        dx=10
                        myRegion.Offset(1800,-2024/18,0,0)
                        print "dx:";dx;myRegion.getx()
                        print "dy:";dy;myRegion.gety()
                        'Screen.drawobject(50, 10,myRegion)
                        Screen.DrawScaledObject(50, 10,1.5,1.5, myRegion)
                        Screen.finish() 
                        else 
                        dx=dx-1
                        ?"Aqui izquierda"
                        myRegion.Offset(-200,0,0,0)
                        print "dx:";dx;myRegion.getx()
                        print "dy:";dy;myRegion.gety()
                        'Screen.drawobject(50,10,myRegion)
                        Screen.DrawScaledObject(50, 10,1.5,1.5, myRegion)
                        Screen.finish()  
                        end if
                        ?"LEFT"
			            pressedState = 4
                else if keypressed=0 then
		        pressedState = -1
		        exit while
                else if keypressed=2 or keypressed=3 or keypressed=4 or keypressed=5 then 
		       pressedState = -1
                end if
	' else if msg = invalid then
    '             print "eventLoop timeout pressedState = "; pressedState
    '             if pressedState=codes.BUTTON_UP_PRESSED then 
    '                     Zip(screen, backgroundRegion, 0,-movedelta)  'up
    '             else if pressedState=codes.BUTTON_DOWN_PRESSED then 
    '                     Zip(screen, backgroundRegion, 0,+movedelta)  ' down
    '             else if pressedState=codes.BUTTON_RIGHT_PRESSED then 
    '                     Zip(screen, backgroundRegion, +movedelta,0)  ' right
    '             else if pressedState=codes.BUTTON_LEFT_PRESSED then 
    '                     Zip(screen, backgroundRegion, -movedelta, 0)  ' left
	' 	end if
        end if
    end while

