# VideoPlayerRokuWithBitmap
roBitmap
El componente roBitmap contiene datos de imagen y proporciona una interfaz (ifDraw2D) para dibujar. Los Bitmaps se pueden usar para una variedad de propósitos, como sprites, composición o como búffers dobles.Almacena cuatro canales de color: rojo, verde, azul y alfa, con 32 bits por píxel. Pueden tener cualquier tamaño arbitrario hasta 2048x2048. Sin embargo, el bitmap de tamaño máximo utiliza 16 MB de memoria, por lo que existen limitacionesprácticas de memoria que obligarían a tamaños de bitmap más pequeños. 
Las coordenadas (x, y) para Bitmaps 2D tienen un origen (0,0) en la parte superior izquierda. roBitmap siempre está fuera de pantalla. El roScreen superior es la única superficie ifDraw2D que se muestra. roBitmap representa algo sobre lo que se puede dibujar.

Las operaciones de dibujo en un bitmap (u otra superficie con la interfaz ifDraw2D, como un roScreen) se recortan para que solo se represente la parte que está dentro de sus límites. 

Las coordenadas X,Y que especifican una ubicación en un bitmap para renderizar pueden ser positivas o negativas. Negativo implica que la parte superior e izquierda del objetorenderizado se recortará. El mismo bitmap no se puede utilizar como origen y destino en una sola llamada DrawObject ().

Existen limitaciones cuando se utiliza el bitmap en pantalla como fuente. Por ejemplo, la combinación alfa puede no funcionar.

Creacion de un roBitmap vacío con CreateObject():

CreateObject("roBitmap", bitmapProps As Object)

bitmapProps es un roAssociativeArray con parámetros de ancho (entero), alto (entero) y AlphaEnable (booleano) y nombre (cadena). El contenido de un RoBitmap vacío se inicializa a cero (negro transparente).

Ejemplo: 

CreateObject("roBitmap",{width:10,height:10,AlphaEnable:false,name:"MyBitmapName"})

Un roBitmap también puede cargar datos de imagen desde un archivo:

CreateObject ("roBitmap", String filename)

roBitmap,roRegion y roScreen implementan ifDraw2D,las coordenadas (x, y) para esta interfaz se basan en un origen (0,0) en la parte superior izquierda.

Los valores de píxel de bitmap y los valores de color siempre se representan como valoresde color RGBA enteros de 32 bits. Es decir, el rojo está en el byte más significativo y el alfa está en el byte menos significativo.

METODOS SOPORTADOS 

Clear(rgba as Integer)

Clears the bitmap, and fills it with the specified RGBA color.

GetWidth() 

Gets the width of the bitmap,return the width of the bitmap in pixels.

GetHeight()

Gets the height of the bitmap in pixels return the height of the bitmap in pixels.

GetByteArray(x as Integer, y as Integer, width as Integer, height as Integer) as Object

Gets the RGBA pixel values for the specified rectangle, Return an roByteArray representing the RGBA pixel values for the specified rectangle.

GetPng(x as Integer, width as Integer, y as Integer, height as Integer) as Object

Gets PNG image data for the specified area of the bitmap. The PNG is in 32-bit RGBA format.Return an roByteArray object containing PNG image data for the specified area of the bitmap.If the coordinates are out of bounds, or the PNG conversion fails for any reason, then invalid is returned

Example:
Here's an example of how to implement a image, and take a part of it with a region.
- Screen = CreateObject("roScreen",false,1280,720)
- bitmap=CreateObject("roBitmap","pkg:/images/logo3.png")
- ?"Tamaños de la imagen"
- print bitmap.GetWidth() 
- print bitmap.GetHeight() 
- 'Region es una parte del bitmap, Escoge toda la imagen 
- 'myRegion=CreateObject("roRegion", bitmap,0,0,bitmap.GetWidth()-200,bitmap.GetHeight()-200)
- 'Escoge solo un cacho y el cacho que esta 200 en "x" y 30  en "y"
- myRegion=CreateObject("roRegion", bitmap,200*2,(2024/18)*5,200,2024/18)
- 'Una bandera que especifica si el ajuste de la región está habilitado. 
- 'Si este indicador se establece en falso, la parte de la región más allá de 
- 'los límites de su mapa de bits no se representa.
- 'myRegion.SetWrap(True)

- 'Dibuja el bitmap
- 'Screen.DrawObject(50, 10, bitmap)
- 'bitmap.DrawObject(10, 20, myRegion)

- 'Dibuja solo la region del bitmap a 50 en "x" y 10 en "y" del origen 
- Screen.DrawObject(50, 10, myRegion)
- Screen.Finish()
- sleep(50000)
