Mastermind game project to familiarise with setting up ruby project and improve readability with rubucop

STARTING A NEW REPO on Github
From local code:
1. navigate to the local project directory
2. initialise the directory as a repo: <git init>
3. add the files to be tracked as part of the project <git add .>
4. commit: <git commit> 
5. create a repo on Github. *Note do not initialise with README, license or .gitignore to avoid conflicts
6. copy the web or SSH address and it as a the remote origin;
   <git remote add origin <address>> >
7. <git remote -v> to check if done right
8. push the code to the main branch: <git push -u origin main> 


From Github:
1. Create new repo on Github
2. Copy the SSH address
3. git clone <ssh address> into desired directory 

README file
1. Create a README.md file if repo was created with existing local code

OOP - Planning project file structure
1. lib directory to contain mastermind ruby files
2. mastermind.rb to require all the files and serves as entry to the game
3. player.rb to manage the player-specific information and moves
4. board.rb to manage the state of the game, checking for wiin conditions and handling moves
5. game.rb to orchestra the flow of the game, handles turns and checks for end of game

Gemfile and Gemfile.lock
1. <bundle init> to create a default Gemfile in the current working directory
2. <bundle add <<gem name>> to add the gem
3. Gemfile has information on where to get the gems from and what gems are required
4. Gemfile.lock has information on what was the last environment that should be able to run your app. 
   Bundler will use it to install the same versions of gems even if Gemfile could potentially allow for newer versions to be installed.

Provide information on Ruby version for people using the project
1. rbenv local <version name e.g. 3.3.0>

Add rubocop to improve readability of ode
1. bundle add rubocop
2. remove requirement as it is an optional file <require: false>
3. <bundle exec rubocop <optional:filename>> to run it. Filename when provided will run rubocop only on that file
4. create a .rubocop.yml file or by using <bundle exec rubocop --init>. this is the configuration file for rubocop
5. Generally we can use the following configurations:
   require: rubocop-performance

   AllCops:
   NewCops: enable

   Style/StringLiterals:
   EnforcedStyle: double_quotes

   Style/FrozenStringLiteralComment:
   EnforcedStyle: never