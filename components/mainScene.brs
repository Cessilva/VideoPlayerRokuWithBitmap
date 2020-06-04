  function init()
  ?"We are here"
    m.top.setFocus(true)
    m.myLabel = m.top.findNode("myLabel")
    m.myLabel.font.size=92
    m.myLabel.color="0x72D7EEFF"
    ' screen = CreateObject("roScreen", TRUE, 1280, 720)
    ' screen.SetAlphaEnable(TRUE)
    ' mainR = CreateObject("roRegion", screen, 32, 8, 1216, 704) ' leaves enough room for overscan
    ' mainR.SetAlphaEnable(TRUE)
    ' hudR = CreateObject("roRegion", mainR, 870, 532, 290, 116) ' Draws to mainR
    ' hudR.SetAlphaEnable(TRUE)
    ' hudR = CreateObject("roRegion", screen, 902, 540, 290, 116) ' Draws to screen
    ' ' bitmap=CreateObject("roBitmap","http://clarovideocdn4.clarovideo.net/PELICULAS/444LASTDAYONEARTH/EXPORTACION_WEB/SPRITES/444LASTDAYONEARTH-SPRITEBAR.jpg")
    ' ' 'bitmap=CreateObject("roBitmap","pkg:/images/logo.jpg")
    ' ' screen.SetAlphaEnable(TRUE)
    ' ' print bitmap.GetWidth() 
    ' ' print bitmap.GetHeight() 
    ' ' ' myRegion=CreateObject("roRegion",bitmap,0,0,bitmap.GetWidth(),bitmap.GetHeight())
    ' ' ' myRegion=CreateObject("roRegion", bitmap, 0, 0,bitmap.GetWidth(),bitmap.GetHeight())
    ' ' ' myRegion.SetWrap(True)
    ' ' ' print myRegion
    ' ' ' bitmap.DrawObject(0, 0, myRegion)
    ' ' ' Screen.DrawObject(0, 0, bitmap)
    ' Screen.Finish()
  
  end function