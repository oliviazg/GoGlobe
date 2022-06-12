# GoGlobe
APCS Final Project

Stevia: EVelyn Chen, OliVIA Zheng

PROTOTYPE GOOGLE DOC: https://docs.google.com/document/d/1NGRB7z_XVNwCPRK_Wa_Kt4WWyce9qffFvhmzbMjOj_Q/edit?usp=sharing

Compile/Run instructions: Run normally! Hit UP, LEFT, and RIGHT arrow keys to navigate ball to the portal; hit space to toggle jump ability.

--------------------------------
Development Log for Evelyn Chen:
--------------------------------
D1: I merged main GoGlobe (created by Olivia) into my own branch and added the instance variables and main methods for GoGlobe. I also started coding generateMaze(double density).

D2: I continued working on GoGlobe, updating setup and the configuration with keys.

D3: I added Time configuration and continued to work on the mazeGenerator and Portal in the main class.

D4: I created the Controller class and updated the main GoGlobe class.

D5 - D8: I worked with Olivia via live coding to fix mazeGenerator, portal, ball movement, difficulty levels, timer, borders, keyPressed and keyReleased.

D9: I worked on the Wind class, but bumped into Processing.app errors that I could not solve on my own.

D10: I continued to work on displaying the Wind element in the main and adding the effects to the Ball.

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
