(local d (require "draw"))

(local highscore-font (love.graphics.newFont 50))
(var highscore "Highscore -1000 Points!")

(fn draw [message]
;(print message)
  (d.draw-background)
  (love.graphics.setColor 0 (/ 204 255) 0)
  (love.graphics.print highscore highscore-font (/ (- (love.graphics.getWidth) (highscore-font.getWidth highscore-font highscore)) 2) (/ (- (love.graphics.getHeight) (highscore-font.getHeight highscore-font)) 2)))

(fn keypressed [key set-mode]
  (when (= key "return")
    (set-mode "mode-play" 30 0 (d.new-target))))

(fn mousepressed [x y button istouch presses set-mode])

(fn update [dt set-mode])

{:activate (fn activate [message] (set highscore message))
    :draw draw
 :keypressed keypressed
 :mousepressed mousepressed
 :update update}

