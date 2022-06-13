# GoGlobe
APCS Final Project

Stevia: EVelyn Chen, OliVIA Zheng

PROTOTYPE GOOGLE DOC: https://docs.google.com/document/d/1NGRB7z_XVNwCPRK_Wa_Kt4WWyce9qffFvhmzbMjOj_Q/edit?usp=sharing

Compile/Run instructions: Our game requires the loading of PNG files (provided in Github's GoGlobe main file). When the game is run...<br />
-) press ENTER/RETURN to switch between the Instructions page and game screen.<br />
-) The goal is to navigate the ball to the portal before the timer runs out using UP, LEFT, RIGHT arrow keys! You can only use the UP arrow key is Jump Ability is on (displayed on top left of the screen). The Jump Ability mode can be toggled on and off using the G key. Collect wind powerups to increase speed. <br />
-) Avoid the bottom border (border kills the ball). Avoid obstacles (ice obstacles deal more damage to Droplet ball, gold obstacles deal more damage to Golden Snitch ball, granite obstacles deal more damage to Stone ball). Your ball dies and the level is reset when your health reaches 0, the timer runs out, or if you hit the ground.<br />
-) To switch between avatars, press 1 on your keyboard to switch your ball to Droplet avatar, press 2 to switch your ball to Golden Snitch avatar", press 3 to switch your ball to Stone avatar.<br />
-) Press SPACE to pause the game.<br />

--------------------------------
Development Log for Evelyn Chen:
--------------------------------
D1 (5/23): I merged main GoGlobe (created by Olivia) into my own branch and added the instance variables and main methods for GoGlobe. I also started coding generateMaze(double density).

D2 (5/24): I continued working on GoGlobe, updating setup and the configuration with keys.

D3 (5/25): I added Time configuration and continued to work on the mazeGenerator and Portal in the main class.

D4 (5/26): I created the Controller class and updated the main GoGlobe class.

D5 - D8 (5/27-5/29): I worked with Olivia via live coding to fix mazeGenerator, portal, ball movement, difficulty levels, timer, borders, keyPressed and keyReleased.

D9 (5/30): I worked on the Wind class, but bumped into Processing.app errors that I could not solve on my own.

D10 (5/31): I continued to work on the code and features in the Wind class.

D11 (6/1): I worked on displaying the Wind powerups on the screen.

D12 (6/2): I continued to work on displaying the Wind powerups on the screen.

D13 (6/3-6/5): I added the effects and attributes of the Wind class to the Ball class.

D14 (6/6): I continued to work on Wind attributes and included windCount in the main.

D15 (6/7): I added the pause feature in main.

D16 (6/8): I cleaned up the maze by changing Ball position to avoid conflicts with the text and added to the pause features.

D17 (6/9): I began working on the introductory menu screen with instructions.

D18 (6/10-12): I updated the menu screen and fixed minor bugs.

----------------------------------
Development Log for Olivia Zheng:
----------------------------------
D1: I merged Evelyn's updated GoGlobe with my own branch. I filled in most of the variables and methods for Ball and Obstacle, and added a few new variables and methods as well.

D2: I created the Wind class and added and updated Ball, Obstacle, and Wind methods.

D3: I hand-sketched Ball and Obstacle designs.

D4: I added pngs to Ball and Obstacle display() methods.

D5 - 8: I met with Evelyn over Zoom. We worked out Maze generator and level advancement, added Ball, Obstacle, and Maze to setup and draw in GoGlobe, and got the Ball and Maze generator to work for our MVP.

D9 - I edited the Obstacle class, but it still doesn't work.

D10 - I got the Obstacle class to show up in the maze and to move. I also created an Obstacle ArrayList in GoGlobe to generate numerous Obstacles, but it still doesn't work.

D11 - I decremented health when gravity is turned off.

D12 - 14: I animated the maze background so that it changes color as countdown decrements. I also made it possible for the player to customize their Ball type.

D13: I added randomly generated Obstacle classes for each maze.

D14: I redrew and added Ball subclass graphics to Ball display().

D15-19: I moved the Ball graphics loading into the GoGlobe class instead of Ball. I redrew the Obstacle graphics and also moved the loading method for the Obstacle subclasses into GoGlobe. 
>>>>>>> 1e1be7dda06e30941fddd2fe310107ab282c2234
