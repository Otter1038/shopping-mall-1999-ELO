Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("Rosie-Wall.jpeg")
$cropPixels = [math]::Round(0.125 * $img.HorizontalResolution)
$newWidth = $img.Width - 2 * $cropPixels
$newHeight = $img.Height - 2 * $cropPixels
$rect = New-Object System.Drawing.Rectangle $cropPixels, $cropPixels, $newWidth, $newHeight
$bitmap = New-Object System.Drawing.Bitmap $img
$cropped = $bitmap.Clone($rect, $bitmap.PixelFormat)
$cropped.Save("Rosie-Wall-cropped.jpeg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
$img.Dispose()
$bitmap.Dispose()
$cropped.Dispose()