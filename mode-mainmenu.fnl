(local d (require "draw"))

(local menu-font (love.graphics.newFont 50))

(fn draw [message]
  (d.draw-background)
  (love.graphics.setColor (/ 204 255) 0 0)
  (let [msg "Press ENTER to start!"]
    (love.graphics.print msg menu-font (/ (- (love.graphics.getWidth) (menu-font.getWidth menu-font msg)) 2) (/ (- (love.graphics.getHeight) (menu-font.getHeight menu-font)) 2))))

(fn keypressed [key set-mode]
  (when (= key "return")
    (set-mode "mode-play" 30 0 (d.new-target))))

(fn mousepressed [x y button istouch presses set-mode])

(fn update [dt set-mode])

{:draw draw
 :keypressed keypressed
 :mousepressed mousepressed
 :update update}

