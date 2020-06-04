
Screen = CreateObject("roScreen",false,1280,720)
bitmap=CreateObject("roBitmap","pkg:/images/logo3.png")
?"Tamaños de la imagen"
print bitmap.GetWidth() 
print bitmap.GetHeight() 
'Region es una parte del bitmap, Escoge toda la imagen 
myRegion=CreateObject("roRegion", bitmap,0,0,bitmap.GetWidth()-200,bitmap.GetHeight()-200)
'Escoge solo un cacho y el cacho que esta 200 en "x" y 30  en "y"
myRegion=CreateObject("roRegion", bitmap,200,2024/18,200,2024/18)
'Una bandera que especifica si el ajuste de la región está habilitado. 
'Si este indicador se establece en falso, la parte de la región más allá de 
'los límites de su mapa de bits no se representa.
'myRegion.SetWrap(True)

'Dibuja el bitmap
'Screen.DrawObject(50, 10, bitmap)
'bitmap.DrawObject(10, 20, myRegion)

'Dibuja solo la region del bitmap a 50 en "x" y 10 en "y" del origen 
Screen.DrawObject(50, 10, myRegion)
Screen.Finish()
sleep(50000)
