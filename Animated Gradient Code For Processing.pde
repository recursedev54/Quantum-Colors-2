import math

def setup():
    fullScreen()  # Set the window to fullscreen
    colorMode(RGB, 255)
    global t, low_res_width, low_res_height, scale_factor
    t = 0  # Initialize time variable
    low_res_width = width // 16  # Further reduce resolution
    low_res_height = height // 16
    scale_factor = 16
    textSize(24)
    fill(0)
    frameRate(60)  # Set the desired frame rate

def draw():
    global t
    t += 0.1  # Adjust the increment for faster animation
    
    low_res_image = createImage(low_res_width, low_res_height, RGB)
    low_res_image.loadPixels()
    for y in range(low_res_height):
        for x in range(low_res_width):
            r = int(255 * (x / low_res_width))
            g = int(255 * ((y + t) % low_res_height / low_res_height))
            b = int(255 * ((x + y + t) % (2 * low_res_width) / (2 * low_res_width)))
            low_res_image.pixels[y * low_res_width + x] = color(r, g, b)
    low_res_image.updatePixels()
    
    image(low_res_image, 0, 0, width, height)  # Scale the low-res image to the full screen

def mousePressed():
    # Get the color under the mouse and display it
    col = get(mouseX, mouseY)
    hex_color = '#{:02x}{:02x}{:02x}'.format(int(red(col)), int(green(col)), int(blue(col)))
    print('Hex Color:', hex_color)
    textAlign(CENTER, CENTER)
    fill(255)
    rect(0, 0, width, 50)
    fill(0)
    text('Hex Color: ' + hex_color, width / 2, 25)
