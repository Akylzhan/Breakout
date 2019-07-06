push = require 'lib/push'

Class = require 'lib/class'

require 'src/constants'

require 'src/Player'
require 'src/Bricks'
require 'src/Ball'

require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/PlayState'
require 'src/states/MenuState'
require 'src/states/GameOverState'

math.randomseed(os.time())

love.graphics.setDefaultFilter('nearest', 'nearest')
love.window.setTitle('Breakout')

gSounds = {
	['touch'] = love.audio.newSource('sounds/touch.wav', 'static'),
	['gameOver'] = love.audio.newSource('sounds/gameOver.wav', 'static')
}
gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 24)
}